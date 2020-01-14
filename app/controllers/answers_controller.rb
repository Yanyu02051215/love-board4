class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_answer, only: [:update,:destroy]
  before_action :correct_user, only: [:edit, :update,:destroy]

  def new
    @answer = Answer.new
    @question = Question.find(params[:id])
  end


  def create
    answer = Answer.new(answer_params)
    # @question = Question.find(params[:id])
    answer.user_id = current_user.id
    answer.question_id = params[:id]
     if answer.save
      redirect_to (question_url(params[:id]))
     else
      render :new
     end
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = Question.find(@answer.question_id)
  end
  

  def update
    @answer = Answer.find(params[:id])
    @question = Question.find(@answer.question_id)
    if @answer.update(answer_params)
      redirect_to(question_url(@question)) 
    else
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @question = Question.find(@answer.question_id)
    @answer.destroy
    redirect_to(question_url(@question)) 
    
  end

  def is_best
    @answer = Answer.find(params[:id])
    @question = Question.find(@answer.question_id)
    # @answer.is_best = 1
    @answer.update(is_best: true)
    redirect_to(question_url(@question)) 
  end



  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end

  def correct_user
    @answer = Answer.find(params[:id])
      unless @answer.user_id == current_user.id
        redirect_to root_url
      end
  end
end


