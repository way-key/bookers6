class FavoritesController < ApplicationController

before_action :book_params
def create
	favorite = Favorite.new(user_id: current_user.id, book_id: @book.id)
	favorite.save
	# redirect_back(fallback_location: root_path)
end

def destroy
	favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id)
	favorite.destroy
	# redirect_back(fallback_location: root_path)
end

	private

	def book_params
		@book = Book.find(params[:id])
	end

end
