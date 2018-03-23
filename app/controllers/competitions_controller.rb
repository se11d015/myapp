class CompetitionsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_competition, only: [:show, :edit, :update, :destroy]

  # GET /competitions
  # GET /competitions.json
  def index
    @competitions = Competition.all
  end

  # GET /competitions/1
  def show
    if current_user.present?
      @user_competition  = UserCompetition.where(user_id: current_user.id, competition_id: params[:id]).first
    end

    @user_competitions = UserCompetition.select("users.email, competitions.created_at, user_competitions.answer")
                                        .joins("INNER JOIN users ON users.id = user_competitions.user_id")
                                        .joins("INNER JOIN competitions ON competitions.id = user_competitions.competition_id")
                                        .where(competition_id: params[:id])
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions
  def create
    @competition = Competition.new(competition_params)
    if @competition.save
      redirect_to @competition, notice: 'Competition was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /competitions/1
  def update
      if @competition.update(competition_params)
        redirect_to @competition, notice: 'Competition was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /competitions/1
  def destroy
    @competition.destroy
    redirect_to competitions_url, notice: 'Competition was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competition_params
      params.require(:competition).permit(:name, :image, :left_time, :participants_number, :details)
    end
end
