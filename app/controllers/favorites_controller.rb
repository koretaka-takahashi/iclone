class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites.all.order(:created_at)
  end
  
  def create
    favorite = current_user.favorites.create(feed_id: params[:feed_id])
    redirect_to feed_path(favorite.feed_id), notice: "<<<#{favorite.feed.user.name}さんの投稿をお気に入り登録しました>>>"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to feed_path(favorite.feed_id), notice: "<<<#{favorite.feed.user.name}さんの投稿をお気に入り解除しました>>>"  
  end
end
