module CommentsHelper
    def max_display_depth
        if logged_in?
            current_user.comment_depth
        else
            7
        end
    end

    def parent_or_self_if_orphan(comment)
        if comment.parent_id
            comment.parent
        else
            comment
        end
    end

    def self_if_parent_or_children_otherwise(comment)
        if comment.parent_id
            [comment]
        else
            comment.children
        end
    end
end
