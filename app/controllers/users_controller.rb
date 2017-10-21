class UsersController < ApplicationController
  #declaring helper method will make views use this method
  helper_method :current_user
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in(@user)
      redirect_to root_path, flash: {success: "User created!"}
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
