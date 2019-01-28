class FeedsController < ApplicationController
  before_action :redirect_if_not_logged_in, except: [:root, :index, :show]
  before_action :check_correct_user, only: [:edit, :update, :destroy]
  
  
  def root
    redirect_to feeds_url
  end
  
  def index
    @feeds = Feed.all  
  end
  
  def show
    set_feed
  end
  
  def new
    @feed = Feed.new  
  end
  
  def edit
  end    
  
  def create 
    @feed = current_user.feeds.build(feed_params)
  
    respond_to do |format| # ここは流石に全く内容不明
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def confirm
    @feed = currnt_user.feeds.build(feed_params)
    render :new if @feed.invalid?
  end
  
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  
  private
  
  def feed_params
    params.require(:feed).permit(:image, :image_cache, :text)  
  end
  
  def set_feed
    @feed = Feed.find_by(id:params[:id])  
  end
  
  def check_correct_user
    set_feed
    if @feed.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/feeds")
    end
  end

end
