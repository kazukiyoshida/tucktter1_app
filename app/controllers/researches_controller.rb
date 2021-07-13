class ResearchesController < ApplicationController
  before_action :set_research, only: [:edit, :show]

  def index
    @researches = Research.all
  end

  def new
    @research = Research.new
  end

  def create
    @research = Research.create(research_params)
    if @research.save
    else
      flash.now[:error_research] = "各入力項目は必須です。研究タイトルは50字以内、研究概要は500文字以内で入力して下さい。"
      render :new
    end
  end

  def edit
  end

  def update
    research = Research.find(params[:id])
    research.update(research_params)
  end

  def show
  end

  def destroy
    research = Research.find(params[:id])
    research.destroy
  end

  def my_research
    @nickname = current_user.Nickname
    @researches = current_user.researches
  end

  private
  def research_params
    params.require(:research).permit(:research_title,:research_summary,:research_url,:research_status).merge(user_id:current_user.id)
  end

  def set_research
    @research = Research.find(params[:id])
  end

end
