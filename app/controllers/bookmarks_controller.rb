class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    @bookmark.list = List.find(params[:list_id])

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
