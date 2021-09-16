module CommentsHelper
    def max_display_depth
        if logged_in?
            current_user.comment_depth
        else
            7
        end
    end
end
