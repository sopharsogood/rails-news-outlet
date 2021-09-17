class ApplicationController < ActionController::Base

    include ApplicationHelper

    private

    def redirect_if_not_logged_in
        unless logged_in?
            update_last_page_before_login
            redirect_to '/login'
        end
    end

    def update_last_page_before_login
        session[:last_page_before_login] = request.path
    end
 
end
