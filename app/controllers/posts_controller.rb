class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]
  # GET /posts or /posts.json
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to posts_path, alert: '不正なアクセスです。'
    end
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    @post.user_id = current_user.id
    #追記した部分ここから
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url
    #ここまで
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(@post), notice: '投稿に成功しました。' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_path(@post), notice: '更新に成功しました。' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    post = Post.find(params[:id])
    post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path(@post), notice: '削除に成功しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:body, :youtube_url, :name)
    end
end
