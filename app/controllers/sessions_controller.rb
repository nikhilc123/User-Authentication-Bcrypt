class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      if @user.authenticate(params[:password])
        log_in(@user)
        redirect_to root_path, flash: {notice: "Successfully logged in!"}
      else
        redirect_to login_path, flash: {notice: "Invalid password!"}
      end
    else
      redirect_to login_path, flash: {notice: "Invalid email"}
    end
  end
end
