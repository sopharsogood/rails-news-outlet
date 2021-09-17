class CommentsController < ApplicationController
    before_action :redirect_if_invalid_article_route

    before_action :redirect_if_comment_not_found_for_article
    skip_before_action :redirect_if_comment_not_found_for_article, only: [:new, :create]

    before_action :redirect_if_not_logged_in
    skip_before_action :redirect_if_not_logged_in, only: [:show]

    def new
        @comment = Comment.new(article: @article, parent: @comment, user: current_user)
    end

    def create
        @comment = Comment.new(new_comment_params)
        if @comment.save
            redirect_to article_comment_path(@article, @comment)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @comment.update(edit_comment_params)
            redirect_to @comment
        else
            render :edit
        end
    end

    def show
    end

    private

    def edit_comment_params
        params.require(:comment).permit(:content)
    end

    def new_comment_params
        params.require(:comment).permit(:content, :user_id, :parent_id, :article_id)
    end

    def redirect_if_invalid_article_route
        @article = Article.find_by(id: params[:article_id])
        if !@article
            flash[:error] = "No such article found."
            redirect_to articles_path
        end
    end

    def redirect_if_comment_not_found_for_article
        @comment = @article.comments.find_by(id: params[:id])
        if !@comment
            flash[:error] = "No such comment found on this article."
            redirect_to @article
        end
    end
end
