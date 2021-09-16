module ApplicationHelper
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find(session[:user_id])
    end

    def current_user_is?(user)
        current_user == user
    end

    def current_user_is_staff?
        current_user.is_staff?
    end
end
