class CommentsController < ApplicationController
    before_action :redirect_if_invalid_article_route

    before_action :redirect_if_comment_not_found_for_article
    skip_before_action :redirect_if_comment_not_found_for_article, only: [:new, :create]

    before_action :redirect_if_not_logged_in
    skip_before_action :redirect_if_not_logged_in, only: [:show]

    before_action :redirect_if_wrong_user, only: [:edit, :update, :destroy]

    before_action :update_last_path_before_login

    def new
        @parent_comment = Comment.find_by(id: params[:id])
        @comment = Comment.new(article: @article, parent: @parent_comment, user: current_user)
    end

    def create
        @comment = Comment.new(new_comment_params)
        if @comment.save
            flash[:message] = "Comment posted!"
            redirect_to article_comment_path(@article, @comment)
        else
            flash[:error] = "Something went wrong. Comment failed to post."
            render :new
        end
    end

    def edit
    end

    def update
        if @comment.update(edit_comment_params)
            flash[:message] = "Comment edited!"
            redirect_to article_comment_path(@article, @comment)
        else
            flash[:error] = "Something went wrong. Your changes to your comment could not be saved."
            render :edit
        end
    end

    def show
    end

    def destroy
        if @comment.children.empty?
            @comment.destroy
            flash[:message] = "Comment deleted!"
            redirect_to @article
        else
            flash[:error] = "Oops! Someone else replied to your comment, and comments with children can't be deleted."
            redirect_to article_comment_path(@article, @comment)
        end
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
        unless @article
            flash[:error] = "No such article found."
            redirect_to articles_path
        end
    end

    def redirect_if_comment_not_found_for_article
        @comment = @article.comments.find_by(id: params[:id])
        unless @comment
            flash[:error] = "No such comment found on this article."
            redirect_to @article
        end
    end

    def redirect_if_wrong_user
        unless current_user_is?(@comment.user)
            flash[:error] = "Only the original poster of a comment can edit or delete it."
            redirect_to article_comment_path(@article, @comment)
        end
    end
end
