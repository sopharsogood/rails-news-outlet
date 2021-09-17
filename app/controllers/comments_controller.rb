class CommentsController < ApplicationController

    def new
        reject_if_comment_does_not_match_article_but_allow_absent_comment
    end

    def create
        unless reject_if_comment_does_not_match_article_but_allow_absent_comment
            @comment = Comment.new(new_comment_params)
            if @comment.save
                redirect_to article_comment_path(@article, @comment)
            else
                render :new
            end
        end
    end

    def edit
        reject_if_comment_does_not_match_article
    end

    def update
        unless reject_if_comment_does_not_match_article
            if @comment.update(edit_comment_params)
                redirect_to @comment
            else
                render :edit
            end
        end
    end

    def show
        reject_if_comment_does_not_match_article
    end

    private

    def reject_if_comment_does_not_match_article
        @article = Article.find_by(id: params[:article_id])
        @comment = Comment.find_by(id: params[:id])
        if !@article
            flash[:error] = "No such article found"
            redirect_to articles_path
            true
        elsif !@comment || @comment.article_id != @article.id
            flash[:error] = "No such comment found on this article"
            redirect_to article
            true
        else
            false
        end
    end

    def reject_if_comment_does_not_match_article_but_allow_absent_comment
        @article = Article.find_by(id: params[:article_id])
        @comment = Comment.find_by(id: params[:article_id])
        if !@article
            flash[:error] = "No such article found"
            redirect_to articles_path
            true
        elsif @comment && @comment.article_id != @article.id
            flash[:error] = "No such comment found on this article"
            redirect_to article
            true
        else
            false
        end
    end

    def edit_comment_params
        params.require(:comment).permit(:content)
    end

    def new_comment_params
        params.require(:comment).permit(:content, :user_id, :parent_id, :article_id)
    end
end
