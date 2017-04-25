class ProvidehelpsController < ApplicationController
# before_action :authenticate!, except: [:index]

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

    if @providehelp.save
      flash[:success] = "You've submitted for Provide Help"
      redirect_to providehelps_path
    else
      flash[:danger] = @providehelp.errors.full_messages
      redirect_to new_providehelp_path
    end
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

  def providehelp_params
    params.require(:providehelp).permit(:user_id, :amount, :pair_user_id)
  end

end
