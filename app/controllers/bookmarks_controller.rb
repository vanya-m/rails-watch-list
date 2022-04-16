class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:update, :destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to @bookmark, notice: 'Bookmark was sucessfully created'
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path, notice: 'Bookmark was sucessfully deleted'
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
