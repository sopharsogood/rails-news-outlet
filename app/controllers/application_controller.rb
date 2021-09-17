class ApplicationController < ActionController::Base

    include ApplicationHelper

    private

    def redirect_if_not_logged_in
        unless logged_in?
            session[:redirected_to_login_from] = request.path
            redirect_to '/login'
            true
        else
            false #made explicit so it's clear how `unless redirect_if_not_logged_in` works
        end
    end
 
end
