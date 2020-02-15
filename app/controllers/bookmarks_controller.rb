class BookmarksController < ApplicationController
  
  def create
    bookmark = Bookmark.create(user_id: current_user.id, question_id: params[:id])
    
    # if bookmark.save
    #   redirect_to (question_url(params[:id]))
    # end
  end

  def destroy
    bookmark = Bookmark.find_by(user_id: current_user.id, question_id: params[:id])
    bookmark.destroy
    # redirect_to(question_url(bookmark.question_id))
  end
end
