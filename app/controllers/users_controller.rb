class UsersController < ApplicationController

  def show
    @questions = current_user.questions.order(created_at: :desc)
    @bookmarks = current_user.bookmarks.order(created_at: :desc)
    # @test = current_user.bookmark_questions


    @question_id = []
    @bookmarks.each do |bookmark|
      @question_id << bookmark.question_id
    end
    @bookmark_questions = Question.where(id: @question_id)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
