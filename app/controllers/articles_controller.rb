class ArticlesController < ApplicationController
    before_action :redirect_if_not_logged_in
    skip_before_action :redirect_if_not_logged_in, only: [:show, :index]

    before_action :redirect_if_not_staff_or_wrong_staff
    skip_before_action :redirect_if_not_staff_or_wrong_staff, only: [:show, :index]

    def new
        @article = Article.new(author: current_user)
    end

    def create
        @article = Article.new(new_article_params)
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(edit_article_params)
            redirect_to @article
        else
            render :edit
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all.order(created_at: :desc)
    end

    private

    def new_article_params
        params.require(:article).permit(:title, :content, :author_id)
    end

    def edit_article_params
        params.require(:article).permit(:title, :content)
    end

    def redirect_if_not_staff_or_wrong_staff
        @article = Article.find_by(id: params[:id])
        if !current_user_is_staff?
            flash[:error] = "Only Newsrail staff can create, edit, or delete articles."
            if @article
                redirect_to @article
            else
                redirect_to articles_path
            end
        elsif @article && !current_user_is?(@article.author)
            flash[:error] = "Only the original author can edit or delete an article."
            redirect_to @article
        end
    end



end
