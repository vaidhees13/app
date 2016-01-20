class TeamsController < ApplicationController
  def index
    @team = Team.all
    @team = Team.search(params[:search])
  end



  def show
    @team = Team.find(params[:id])
    redirect_to :action => "index"
  end

  def new
    @team=Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(team_params)
      redirect_to @team
    else
      render 'edit'
    end

  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to @team
  end

  private
  def team_params
    params.require(:team).permit(:name,:description)

  end

end

