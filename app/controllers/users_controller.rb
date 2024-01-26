class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_update_params)
      flash[:notice] = 'プロフィールが変更されました'
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_update_params
    params.require(:user).permit(:name, :nickname, :image)
  end
end
