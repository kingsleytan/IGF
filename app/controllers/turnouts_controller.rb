class TurnoutsController < ApplicationController

  def index
    @turnouts = Turnout.all
  end

  def show
  end

  def new
    @turnout = Turnout.new
  end

  def create
    @turnout = Turnout.new(turnout_params)

    if @turnout.save
      redirect_to turnouts_path
    else
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
