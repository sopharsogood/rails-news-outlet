module ArticlesHelper
    def open_h_tag(index)
        if index < 3
            "<h2>"
        else
            "<h3>"
        end
    end

    def close_h_tag(index)
        if index < 3
            "</h2>"
        else
            "</h3>"
        end
    end

    def author_byline(article)
        "by #{link_to article.author.name, article.author}"
    end

    def display_article_link(article)
        link_to article.title, article
    end
        
end
