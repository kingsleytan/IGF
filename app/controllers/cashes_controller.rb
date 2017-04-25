class CashesController < ApplicationController
# before_action :authenticate!, except: [:index]
# before_action :find_or_create_pins
  def index
    @cashes = Cash.all
  end

  def show
    @cashes = current_user.cashes.all
  end

  def new
    @cash = Cash.new
  end

  def create
    @cash = current_user.cashes.build(cash_params)

    if @cash.save
      flash[:success] = "You've created cash"
      redirect_to cashes_path
    else
      flash[:danger] = @cash.errors.full_messages
      redirect_to new_cash_path
    end
  end

  def newcashtransfer
    @cash = Cash.new
  end

  def transfercash
    @transferuser = User.find_by(id: cash_params[:transfer_user_id])
    @cash = @transferuser.cashes.build(cash_params).update(amount: 0)
    updatecash(@transferuser, 1)
    updatecash(current_user, -1)
  end

  def addcash
    @user = User.find_by(id: params[:user_id])
    @pin = @user.cashes.create(amount: 1)
  end

  def deductcash
    @user = User.find_by(id: params[:user_id])
    @pin = @user.cashes.create(amount: -1)
  end


  private

  def updatecash(user, amount)
    @pin = user.cashes.create(amount: amount)
  end

    # def find_or_create_pins
    #   @pin = current_user.pins.find_or_create_by(amount: 0)
    # end

  def cash_params
    params.require(:cash).permit(:user_id, :amount, :transfer_user_id, :transfer_amount)
  end

end
