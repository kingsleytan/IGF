class PinsController < ApplicationController
# before_action :authenticate!, except: [:index]

  def index
    @pins = Pin.all
  end

  def show
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

  def transfer
#store the original pin info
    @original_pin = current_user.pins
#declare all the transfer info
    @transfer_amount = pin.transfer_amount
    @transfer_user_id = pin.transfer_user_id
#find transfer username
    @transfer_pin = Pin.find_by(id: transfer_user_id)
#add/deduct pins accordingly
    @original_pin.update(amount: original_pin.amount - transfer_amount, transfer_amount: 0)
    @transfer_pin.update(amount: original_pin.amount + transfer_amount)
  end

  def edit
    @pin = Pin.find_by(id: params[:id])
    # authorize @pin
  end

  def update
    #store the original pin info
        @original_pin = current_user.pins
    #declare all the transfer info
        @transfer_amount = @original_pin.transfer_amount
        @transfer_user_id = @original_pin.transfer_user_id
    #find transfer username
        @transfer_pin = Pin.find_by(id: transfer_user_id)
    # authorize @pin
    if @pin.update(pin_params)
      #add/deduct pins accordingly
          @original_pin.update(amount: @original_pin.amount - transfer_amount, transfer_amount: 0)
          @transfer_pin.update(amount: @original_pin.amount + transfer_amount)
      redirect_to pins_path
    else
      redirect_to edit_pin_path(@pin)
    end
  end

  private

  def pin_params
    params.require(:pin).permit(:user_id, :amount, :transfer_user_id, :transfer_amount)
  end

end
