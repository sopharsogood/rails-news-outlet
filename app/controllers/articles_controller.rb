class ArticlesController < ApplicationController

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

end
