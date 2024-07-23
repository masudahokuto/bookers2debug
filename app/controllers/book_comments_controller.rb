class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user = current_user
    if @book_comment.save
      respond_to do |format|
        format.js
      end
    else
      render 'books/show'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = BookComment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
