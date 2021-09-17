class ArticlesController < ApplicationController

    def new
        @article = Article.new(author: current_user)
    end

    def create
        @article = Article.new(new_article_params)
    end

    private

    def new_article_params
        params.require(:article).permit(:title, :content, :author_id)
    end
    
end
