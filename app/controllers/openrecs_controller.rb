class OpenrecsController < ApplicationController
  before_action :set_openrec, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]
  # GET /openrecs or /openrecs.json
  def index
    @openrecs = Openrec.all.order(created_at: :desc)
  end

  # GET /openrecs/1 or /openrecs/1.json
  def show
    @openrec = Openrec.find(params[:id])
    @user = @openrec.user
  end

  # GET /openrecs/new
  def new
    @openrec = Openrec.new
  end

  # GET /openrecs/1/edit
  def edit
    @openrec = Openrec.find(params[:id])
    if @openrec.user != current_user
      redirect_to openrecs_path, alert: '不正なアクセスです。'
    end
  end

  # POST /openrecs or /openrecs.json
  def create
    @openrec = Openrec.new(openrec_params)
    # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    @openrec.user_id = current_user.id
        #追記した部分ここから
    url = params[:openrec][:openrec_url]
    url = url.last(11)
    @openrec.openrec_url = url
    #ここまで
    respond_to do |format|
      if @openrec.save
        format.html { redirect_to openrec_path(@openrec), notice: '投稿に成功しました。' }
        format.json { render :show, status: :created, location: @openrec }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @openrec.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /openrecs/1 or /openrecs/1.json
  def update
    @openrec = Openrec.find(params[:id])
    respond_to do |format|
      if @openrec.update(openrec_params)
        format.html { redirect_to openrec_path(@openrec), notice: '更新に成功しました。' }
        format.json { render :show, status: :ok, location: @openrec }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @openrec.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /openrecs/1 or /openrecs/1.json
  def destroy
    openrec = Openrec.find(params[:id])
    openrec.destroy
    respond_to do |format|
      format.html { redirect_to openrecs_path(@openrec), notice: '削除に成功しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_openrec
      @openrec = Openrec.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def openrec_params
      params.require(:openrec).permit(:openrec_url, :body, :name, :user_id)
    end
end
