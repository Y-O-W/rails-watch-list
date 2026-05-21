class BookmarksController < ApplicationController
  before_action :set_list, only: [ :new, :create ]
  def new
    @bookmark = Bookmark.new
  end

  def create
  end

  def destroy
  end

  private

  def set_list
    @list = List.find(params[:id])
  end
end
