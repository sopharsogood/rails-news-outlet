module ApplicationHelper
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def current_user_is?(user)
        current_user == user
    end

    def current_user_is_staff?
        logged_in? && current_user.is_staff?
    end
end
