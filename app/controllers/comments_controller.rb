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
            if @article.update(edit_article_params)
                redirect_to @article
            else
                render edit_article_path(@article)
            end
        end
    end

    private

    def reject_if_comment_does_not_match_article
        @article = Article.find_by(id: params[:article_id])
        @comment = Comment.find_by(id: params[:id])
        if !@article
            flash[:error] = "No such article found"
            redirect_to articles_path
            true
        elsif !@comment || @comment.article_id != article.id
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
        elsif @comment && @comment.article_id != article.id
            flash[:error] = "No such comment found on this article"
            redirect_to article
            true
        else
            false
        end
    end

    def edit_article_params
        params.require(:article).permit(:title, :content)
    end
end
