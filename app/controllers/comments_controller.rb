class CommentsController < ApplicationController

    private

    def reject_if_comment_does_not_match_article
        article = Article.find_by(id: params[:article_id])
        comment = Comment.find_by(id: params[:id])
        if !article
            flash[:error] = "No such article found"
            redirect_to articles_path
            true
        elsif !comment || comment.article_id != article.id
            flash[:error] = "No such comment found on this article"
            redirect_to article
            true
        else
            false
        end
    end
end
