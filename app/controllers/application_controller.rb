class ApplicationController < ActionController::Base

    include ApplicationHelper

    private

    def redirect_if_not_logged_in
        unless logged_in?
            update_last_path_before_login
            redirect_to '/login'
        end
    end

    def update_last_path_before_login
        session[:last_path_before_login] = request.path
    end
 
    def read_if_unread
        if logged_in? && !!@article
            Reading.find_or_create_by(reader: current_user, read_article: @article)
        end
    end
    
end
