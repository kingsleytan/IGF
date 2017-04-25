class GethelpsController < ApplicationController
# before_action :authenticate!, except: [:index]

  def index
    @gethelps = Gethelp.all
  end

  def show
  end

  def new
    @gethelp = Gethelp.new
  end

  def create
    @gethelp = current_user.gethelps.build(gethelp_params)

    if @gethelp.save
      flash[:success] = "You've submitted for get Help"
      redirect_to gethelps_path
    else
      flash[:danger] = @gethelp.errors.full_messages
      redirect_to new_gethelp_path
    end
  end

  def edit
    @gethelp = Gethelp.find_by(id: params[:id])
    # authorize @gethelp
  end

  def update
    @gethelp = Gethelp.find(params[:id])
    # authorize @gethelp
    if @gethelp.update(gethelp_params)
      redirect_to gethelps_path
    else
      redirect_to edit_gethelp_path(@gethelp)
    end
  end

  def destroy
    @gethelp = Gethelp.find(params[:id])
    authorize @gethelp
    if @gethelp.destroy
      redirect_to gethelps_path
    else
      redirect_to edit_gethelp_path(@gethelp)
    end
  end

  private

  def gethelp_params
    params.require(:gethelp).permit(:user_id, :amount, :pair_user_id)
  end

end
