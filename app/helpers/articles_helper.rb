module ArticlesHelper
    def h_tag_number(index)
        if index < 3
            "2"
        else
            "3"
        end
    end

    def author_byline(article)
        link_to "by #{article.author.name}", article.author
    end

    def display_article_link(article)
        link_to_unless_current article.title, article
    end
        
end
