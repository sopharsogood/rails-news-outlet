module CommentsHelper
    def max_display_depth
        if logged_in?
            current_user.comment_depth
        else
            7
        end
    end

    def parent_or_self_if_orphan(comment)
        if comment.has_parent?
            comment.parent
        else
            comment
        end
    end

    def self_if_parent_or_children_otherwise(comment)
        if comment.has_parent?
            [comment]
        else
            comment.children
        end
    end

    def display_comment_link(comment)
        link_to comment.content, article_comment_path(comment.article, comment)
    end

    def display_created_at(comment)
        comment.created_at.strftime("%a %-d/%-m/%y at %-I:%M %p")
    end

    def comment_form_submission_path(comment)
        if comment.has_parent?
            article_new_comment_reply_path(comment.article, comment.parent)
        else
            article_comments_path(comment.article)
        end
    end

    def initial_highlight_depth(comment)
        if comment.has_parent?
            2
        else
            1
        end
    end

end
