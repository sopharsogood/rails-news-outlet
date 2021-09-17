class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(new_user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :login
        end
    end


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

    private

    def new_user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
