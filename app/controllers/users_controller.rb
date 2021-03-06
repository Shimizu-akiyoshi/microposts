class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[ :success ] = "Comleted edit."
      redirect_to edit_user_path(@user)
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[ :success ] = "Welcome to the Sample app!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def followings
    @user  = User.find(params[:id])
    @followings = @user.following_users
  end
  
  def followers
    @user  = User.find(params[:id])
    @followers = @user.follower_users
  end
  
  def favorites
    @user = User.find(params[:id])
    @favorite = @user.favorite_microposts
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :location, :profile,
                                 :password_confirmation)
  end
  
end