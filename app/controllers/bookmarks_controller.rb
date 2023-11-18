# frozen_string_literal: true

# Class comment
class BookmarksController < ApplicationController
def new
  @bookmark = Bookmark.new()
  @list = List.find(params[:list_id])

end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    
    
    @bookmark.save

    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
