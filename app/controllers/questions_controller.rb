class QuestionsController < ApplicationController
  before_action :authenticate_user!,only:[:edit,:new,:create,:update,:destroy]
  before_action :find_question, only: [:show,:edit,:update,:destroy]
  before_action :correct_user, only: [:edit, :update,:destroy]
  impressionist :actions=> [:show]
  def index
    @search = Question.ransack(params[:q])
    @bestanswers = Answer.where(is_best: 1)
    @bestanswer_id = @bestanswers.map{|bestanswer| bestanswer.question_id }
    @btquestions = Question.where(id: @bestanswer_id)
    @btquestion_id = @btquestions.map{|btquestion| btquestion.id }
    @results = @search.result.page(params[:page]).per(10)
  end

  def show
    @answers = Answer.where(question_id: params[:id])
    @reaction = Reaction.new
    @answe_is_best = []
     @answers.each do |answer|
      @answe_is_best << answer.is_best
     end
    @bestanswer = @answers.find_by(is_best: true)
    if @bestanswer
    @bestuser = User.find(@bestanswer.user_id)
    end
    impressionist(@question, nil, unique: [:session_hash])
   
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

  def gender
    @users = User.where(gender: params[:gender])
    @questions = @users.map{|user| user.questions }
    @search = Question.ransack(params[:q])
    @user = @users.map{|user| user }
  end

  def age
    @users = User.where(age: params[:age])
    @questions = @users.map{|user| user.questions }
    @search = Question.ransack(params[:q])
  end

  def category
    @questions = Question.where(category: params[:category])
    @search = Question.ransack(params[:q])
  end

  def userrank
    @user_ranks = User.find(Answer.group(:user_id).order('count(user_id) desc').limit(10).pluck(:user_id))
    @search = Question.ransack(params[:q])
  end

  def rank
    @all_ranks = Question.find(Bookmark.group(:question_id).order('count(question_id) desc').limit(10).pluck(:question_id))
    @search = Question.ransack(params[:q])
  end

  def pvrank
    @pv_ranks = Question.find(Impression.group(:impressionable_id).order('count(impressionable_id) desc').limit(10).pluck(:impressionable_id))
    @search = Question.ransack(params[:q])
  end


  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body, :category)
  end

  def correct_user
    @question = Question.find(params[:id])
      unless @question.user_id == current_user.id
        redirect_to root_url
      end
  end

end
