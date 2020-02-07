class QuestionsController < ApplicationController
  before_action :authenticate_user!,only:[:edit,:new,:create,:update,:destroy]
  before_action :find_question, only: [:show,:edit,:update,:destroy]
  before_action :correct_user, only: [:edit, :update,:destroy]
  def index
    
    @search = Question.ransack(params[:q])
    @results = @search.result.page(params[:page])
  end

  def show
    @answers = Answer.where(question_id: params[:id])
    @reaction = Reaction.new
    @answe_is_best = []
     @answers.each do |answer|
      @answe_is_best << answer.is_best
     end
    @bestanswer = @answers.find_by(is_best: true)
    # @bestuser = User.find(@bestanswer.user_id)
   
  end

  def edit
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
     if @question.save
      redirect_to @question,notice:'投稿に成功しました'
     else
      render :new,alert:'投稿に失敗しました'
     end
  end

  def update
    if @question.update(question_params)
      redirect_to @question,notice:'編集に成功しました'
    else
      render :edit,alert:'編集に失敗しました'
    end
  end

  def destroy
    if @question.destroy
      redirect_to root_path,notice:'削除に成功しました'
    else
      redirect_to root_path,alert:'削除に失敗しました'
    end
  end

  def test
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def correct_user
    @question = Question.find(params[:id])
      unless @question.user_id == current_user.id
        redirect_to root_url
      end
  end

end
