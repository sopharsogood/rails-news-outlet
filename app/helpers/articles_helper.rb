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

    def display_with_footnotes(content)
        footnotes = ""
        # \[\[([^\]]+)\]\] matches anything [[enclosed in double brackets]]
        # and saves the contents of the double brackets, but not the double brackets, in $1
        content.gsub!(\[\[([^\]]+)\]\]).with_index do |footnote, index|
            i = index+1
            footnotes << "<p class='footnote' id='footnote-#{i}>"
            footnotes << "<sup><a href='#reference-#{i}'>[#{i}]</a></sup>"
            footnotes << $1
            footnotes << "</p>"
            "<sup id='reference-#{i}'><a href='#footnote-#{i}'>[#{i}]</a></sup>"
        end
        content += footnotes
    end
        
end
