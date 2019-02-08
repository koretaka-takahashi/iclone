class FeedsController < ApplicationController
  before_action :redirect_if_not_logged_in, except: [:root, :index, :show]
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action :check_correct_user, only: [:edit, :update, :destroy]
  
  
  def index
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end  
    @feeds = Feed.all  
  end
  
  def show
    @favorite = current_user.favorites.find_by(feed_id: @feed.id)
  end
  
  # def new
  #   @feed = Feed.new  
  # end
  
  def edit
  end    
  
  def create 
    @feed = current_user.feeds.build(feed_params)
    if @feed.save
      FeedMailer.feed_mail(@feed).deliver
      redirect_to feeds_path, notice: '<<<投稿しました>>>'
    else
      render :index
    end
  end
  
  def confirm
    @feeds = Feed.all  
    @feed = current_user.feeds.build(feed_params)
    render :index if @feed.invalid?
  end
  
  def update
    if @feed.update(feed_params)
      redirect_to feeds_path, notice: '<<<投稿を更新しました>>>'
    else
      render :edit
    end
  end

  
  def destroy
    @feed.destroy
    redirect_to feeds_url, notice: '<<<投稿を削除しました>>>'
  end
  

  
  private
  
  def feed_params
    params.require(:feed).permit(:image, :image_cache, :text)  
  end
  
  def set_feed
    @feed = Feed.find(params[:id])
  end
  
  def check_correct_user
    if @feed.user_id != current_user.id
      flash[:notice] = "<<<権限がありません>>>"
      redirect_to("/feeds")
    end
  end

end
