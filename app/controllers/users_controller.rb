class UsersController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:edit, :update]

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
    
    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(edit_user_params)
            redirect_to @user
        else
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
            redirect_to root_path
        else
            @user = User.new unless @user
            render :login
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to login_path
    end

    private

    def new_user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def edit_user_params
        params.require(:user).permit(:name, :email, :bio, :theme, :comment_depth)
    end

end
