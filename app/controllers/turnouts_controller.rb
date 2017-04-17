class TurnoutsController < ApplicationController
before_action :authenticate!, except: [:index]
  def index
    @turnouts = Turnout.all
  end

  def show
  end

  def new
    @turnout = Turnout.new
  end

  def create
    @turnout = current_user.turnouts.build(turnout_params)

    if @turnout.save
      flash[:success] = "You've signed attendance"
      redirect_to turnouts_path
    else
      flash[:danger] = @turnout.errors.full_messages
      redirect_to new_turnout_path
    end
  end

  def edit
    @turnout = Turnout.find_by(id: params[:id])
  end

  def update
    @turnout = Turnout.find(params[:id])
    if @turnout.update(turnout_params)
      redirect_to turnouts_path
    else
      redirect_to edit_turnout_path(@turnout)
    end
  end

  def destroy
    @turnout = Turnout.find(params[:id])
    if @turnout.destroy
      redirect_to turnouts_path
    else
      redirect_to edit_turnout_path(@turnout)
    end
  end

  private

  def turnout_params
    params.require(:turnout).permit(:user_id, :location)
  end

end
