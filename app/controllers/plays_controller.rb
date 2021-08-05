class PlaysController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @plays = Play.all.order(created_at: :desc)
  end

  def show
    @play = Play.find(params[:id])
  end

  def new
    @play = Play.new
  end
  
  def create
    @play = Play.new(play_params)
    @play.user_id = current_user.id
    if @play.save
      redirect_to play_path(@play), notice: '投稿に成功しました。'
    else
      render :new
    end
  end

  def edit
    @play = Play.find(params[:id])
    if @play.user != current_user
      redirect_to plays_path, alert: '不正なアクセスです。'
    end
  end
  
  def update
    @play = Play.find(params[:id])
    if @play.update(play_params)
      redirect_to play_path(@play), notice: '更新に成功しました。'
    else
      render :edit
    end
  end
  
  def destroy
    play = Play.find(params[:id])
    play.destroy
    redirect_to plays_path
  end
  
  def play_params
    params.require(:play).permit(:title, :body, :image)
  end
end
