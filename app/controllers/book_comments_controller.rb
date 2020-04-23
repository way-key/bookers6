class BookCommentsController < ApplicationController

	def create
		@book = Book.find(params[:book_id])
		@comment = @book.book_comments.new(comment_params)
		# byebug
		@comment.user_id = current_user.id
		if @comment.save
		   @comments = @book.book_comments
			render :action
		else
			@book = Book.find(params[:book_id])
		end
	end

	def destroy
		@comment = BookComment.find(params[:id])
		if @comment.destroy
			@book = Book.find(params[:book_id])
		   @comments = @book.book_comments
			render :action
		else
			@book = Book.find(params[:book_id])
		end
	end

	private

	def comment_params
		params.require(:book_comment).permit(:comment, :book_id, :user_id)
	end

end
