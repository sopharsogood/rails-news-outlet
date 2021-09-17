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

    def display_comment_link(comment)
        link_to comment.content, article_comment_path(comment.article, comment)
    end

    def display_created_at(comment)
        "created @"
    end

    def comment_form_submission_path(comment)
        if comment.parent_id
            article_new_comment_reply_path(comment.article, comment.parent)
        else
            new_article_comment_path(comment.article)
        end
    end

end
