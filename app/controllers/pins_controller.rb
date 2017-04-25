class PinsController < ApplicationController
# before_action :authenticate!, except: [:index]
# before_action :find_or_create_pins
  def index
    @pins = Pin.all
  end

  def show
    @pins = current_user.pins.all
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      flash[:success] = "You've created pins"
      redirect_to pins_path
    else
      flash[:danger] = @pin.errors.full_messages
      redirect_to new_pin_path
    end
  end

#For transfer pin, split into addpin & deductpin

  def newpintransfer
    @pin = Pin.new
  end

  def transferpin
    @transferuser = User.find_by(id: pin_params[:transfer_user_id])
    @pin = @transferuser.pins.build(pin_params).update(amount: 0)
    updatepin(@transferuser, 1)
    updatepin(current_user, -1)
  end

  def addpin
    @user = User.find_by(id: params[:user_id])
    @pin = @user.pins.create(amount: 1)
  end

  def deductpin
    @user = User.find_by(id: params[:user_id])
    @pin = @user.pins.create(amount: -1)
  end


  private

  def updatepin(user, amount)
    @pin = user.pins.create(amount: amount)
  end

    # def find_or_create_pins
    #   @pin = current_user.pins.find_or_create_by(amount: 0)
    # end

  def pin_params
    params.require(:pin).permit(:user_id, :amount, :transfer_user_id, :transfer_amount)
  end

end
