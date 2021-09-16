class UsersController < ApplicationController

    def login
        @user = User.new
    end

    def signin
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            @user = User.new unless @user
            render :login
        end
    end

end
