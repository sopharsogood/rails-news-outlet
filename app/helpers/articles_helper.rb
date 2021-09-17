module ArticlesHelper
    def h_tag_number(index)
        if index < 3
            "2"
        else
            "3"
        end
    end

    def author_byline(article)
        "by #{link_to article.author.name, article.author}"
    end

    def display_article_link(article)
        link_to article.title, article
    end
        
end
