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
end
