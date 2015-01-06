class EntriesController < ApplicationController

  before_action :authenticate_user!

  def create
    @challenge = Challenge.find(params[:challenge_id])

    if current_user.joined_challenges.include?(@challenge)
      render status: 403, json: { error: "You've already accepted this challenge." }
      return
    end
    @entry = Entry.new(challenge_id: params[:challenge_id], user_id: current_user.id)

    if @entry.save
      redirect_to :back
    else
      render status: 403, json: { error: @entry.errors }
    end
  end

  def destroy
    @challenge = Challenge.find(params[:challenge_id])
    @entry = Entry.find(params[:id])

    @entry.destroy
    redirect_to :back
  end

end
