class Admin::UsersController < ApplicationController
  before_action :require_admin, only: [:new, :edit, :create, :destroy, :update]

  helper_method :sort_column, :sort_direction
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per(5).order('kana ASC')

    respond_to do |format|
      format.html
      format.csv {send_data @users.generate_csv, filename: "users-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end
  end
    
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @reports = @user.reports.page(params[:page]).per(5).order('created_at DESC')
  end

  def create
    @user = User.new(user_params)

    if @user.save
        redirect_to admin_user_path(@user), notice: "講師「#{@user.name}先生」を登録しました。"
    else
        render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
        redirect_to admin_user_path(@user), notice: "講師「#{@user.name}先生」を更新しました。"
    else
        render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: "講師「#{@user.name}先生」を削除しました。"
  end

  def import
    User.import(params[:file])
    redirect_to admin_users_url, notice: "講師を追加しました。"
  end

  private def user_params
    params.require(:user).permit(:name, :kana, :email, :admin, :password, :password_confirmation, :subject)
  end

  private def require_admin
    redirect_to root_url unless current_user.admin?
  end
  
end
