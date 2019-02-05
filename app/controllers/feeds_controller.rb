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
  end
  
  # def new
  #   @feed = Feed.new  
  # end
  
  def edit
    #@feed = Feed.find(feed_params)
  end    
  
  def create 
    # @feeds = Feed.all
    @feed = current_user.feeds.build(feed_params)
    if @feed.save
      redirect_to feeds_path, notice: 'Feed was successfully created.'
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
      redirect_to feeds_path, notice: 'Feed was successfully updated.'
    else
      render :edit
    end
  end

  
  def destroy
    @feed.destroy
    redirect_to feeds_url, notice: 'Feed was successfully destroyed.'
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
      flash[:notice] = "権限がありません"
      redirect_to("/feeds")
    end
  end

end
