class ProvidehelpsController < ApplicationController
# before_action :authenticate!, except: [:index]
respond_to :js

  def index
    @providehelps = Providehelp.all
  end

  def show
  end

  def new
    @providehelp = Providehelp.new
  end

  def create
    @providehelp = current_user.providehelps.build(providehelp_params)
    @pin = current_user.pins.create(amount: -1)

    if @providehelp.save
      flash[:success] = "You've submitted for Provide Help"
      redirect_to providehelps_path
    else
      flash[:danger] = @providehelp.errors.full_messages
      redirect_to new_providehelp_path
    end
  end

#pairing
  def newpairing
    @user = User.find_by(id: params[:user_id])
    @providehelp = Providehelp.new
  end

  def pairing
    @transferuser = User.find_by(id: providehelp_params[:transfer_user_id])
    @providehelp = @transferuser.providehelps.build(providehelp_params).update(amount: 0)
    updategethelp(@transferuser, 1)
    updateprovidehelp(current_user, -1)
  end

  def edit
    @providehelp = Providehelp.find_by(id: params[:id])
    # authorize @providehelp
  end

  def update
    @providehelp = Providehelp.find(params[:id])
    # authorize @providehelp
    if @providehelp.update(providehelp_params)
      redirect_to providehelps_path
    else
      redirect_to edit_providehelp_path(@providehelp)
    end
  end

  def destroy
    @providehelp = Providehelp.find(params[:id])
    authorize @providehelp
    if @providehelp.destroy
      redirect_to providehelps_path
    else
      redirect_to edit_providehelp_path(@providehelp)
    end
  end

  private

  def updatepin(user, amount)
    @pin = user.pins.create(amount: amount)
  end

  def updateprovidehelp(user, transfer_amount)
    @providehelp = user.providehelps.create(amount: 0, transfer_amount: transfer_amount)
  end

  def updategethelp(user, transfer_amount)
    @gethelp = user.gethelps.create(amount: 0, transfer_amount: transfer_amount)
  end

  def providehelp_params
    params.require(:providehelp).permit(:user_id, :amount, :pair_user_id)
  end

end
