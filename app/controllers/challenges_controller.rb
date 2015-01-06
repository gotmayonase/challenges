class ChallengesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @challenges = Challenge.all
    @accepted = current_user ? Challenge.joined_by_user(current_user) : []
    @created = current_user ? current_user.created_challenges : []
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = current_user
    if @challenge.save
      redirect_to challenges_path, success: 'Well done.'
    else
      render 'new', errors: @challenge.errors
    end
  end


  def edit
    @challenge = Challenge.find(params[:id])

    unless @challenge.user == current_user
      render status: 401
      return
    end
  end

  def update
    @challenge = Challenge.find(params[:id])

    unless @challenge.user == current_user
      render status: 401
      return
    end

    if @challenge.update_attributes(challenge_params)
      redirect_to challenge_path(@challenge), success: 'Well done.'
    else
      render 'new', errors: @challenge.errors
    end
  end

  private

    def challenge_params
      params.require(:challenge).permit(:name, :description, :starts_at, :ends_at, tasks_attributes: [:id, :name, :_destroy])
    end

end
