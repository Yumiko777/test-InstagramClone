class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action:logged_in?, only:[:new,:create]
  before_action :own_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to show, notice: "プロフィールを編集しました！"
    else
      render :edit
    end
  end

  def favorites
    @user = User.find_by(id: params[:id])
    @favorites = current_user.favorite_pictures.all
  end

  private
  def user_params
    params.require(:user).permit(:image, :name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def own_user
    if current_user.id != @user.id
      redirect_to user_path
    end
  end
end
