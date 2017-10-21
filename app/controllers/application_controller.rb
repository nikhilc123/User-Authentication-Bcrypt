class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out(user)
    session[:user_id] = nil
  end

  def current_user
    #You do not want to hit the database(see below) everytime you call user
    #so check 1. return and if it is false assign @current_user = ........
    #User Load (2.0ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 5], ["LIMIT", 1]]
    #CACHE User Load (0.0ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 5], ["LIMIT", 1]]
    #CACHE User Load (0.0ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 5], ["LIMIT", 1]]

    return @current_user if @current_user

    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      nil
    end
  end
end
