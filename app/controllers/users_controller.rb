class UsersController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:edit, :update]
    before_action :redirect_if_wrong_user, only: [:edit, :update]

    before_action :update_last_path_before_login, only: [:show, :edit, :update]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(new_user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:message] = "Signup complete! Welcome to Newsrail, #{@user.name}!"
            return_or_index
        else
            flash[:error] = "Something went wrong. New account couldn't be created."
            render :login
        end
    end
    
    def show
        @user = User.find(params[:id])
    end

    def edit
    end

    def update
        if @user.update(edit_user_params)
            flash[:message] = "Profile and settings changes saved!"
            redirect_to @user
        else
            flash[:error] = "Something went wrong. Profile and settings couldn't be saved."
            render :edit
        end
    end

    def login
        @user = User.new
    end

    def signin
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            flash[:message] = "Login complete! Welcome back, #{@user.name}!"
            return_or_index
        else
            @user = User.new(email: params[:user][:email])
            flash[:error] = "Email or password incorrect. Make sure you've typed everything correctly."
            render :login
        end
    end

    def logout
        if logged_in?
            flash[:message] = "Logout complete! Goodbye for now, #{current_user.name}."
            session[:user_id] = nil
        else
            flash[:error] = "You're already logged out."
        end
        redirect_to login_path
    end

    private

    def new_user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def edit_user_params
        params.require(:user).permit(:name, :email, :bio, :theme, :comment_depth)
    end

    def redirect_if_wrong_user
        @user = User.find(params[:id])
        unless current_user_is?(@user)
            flash[:error] = "A user's page can only be edited by that user themselves."
            redirect_to @user
        end
    end

    def return_or_index
        if session[:last_path_before_login]
            redirect_to session[:last_path_before_login]
        else
            redirect_to articles_path
        end
    end

end
