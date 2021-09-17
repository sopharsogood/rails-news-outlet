module ArticlesHelper
    def h_tag_number(index)
        if index < 3
            "2"
        else
            "3"
        end
    end

    def display_article_link(article)
        link_to article.title, article
    end
        
end
