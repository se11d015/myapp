class SolutionsController < ApplicationController
  before_action :authenticate_user!, only: [:join_competition, :submit_competition]

  # GET /join_compotition/2
  def join_competition
    @user_competition = UserCompetition.where(:user_id => current_user.id, :competition_id => params[:id]).first

    if @user_competition.present?
      @status = "You are already joined this competition"
    else
      @status = "You are joined"
      @user_competition = UserCompetition.create!(:user_id => current_user.id, :competition_id => params[:id])
    end
  end

  def submit_competition
      user_competition_id = params[:id]
      answer = params[:user_competition][:answer]

      user_competition = UserCompetition.where(id: user_competition_id).first
      user_competition.update!(answer: answer)

      redirect_to "/competitions/#{user_competition.competition_id}"
  end

end
