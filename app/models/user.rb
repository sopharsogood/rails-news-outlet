class User < ApplicationRecord
    # t.string "name"
    # t.string "password_digest"
    # t.string "email"
    # t.string "theme", default: "light"
    # t.integer "comment_depth", default: 7
    # t.string "bio"
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false

    has_many :written_articles, class_name: "Article", foreign_key: "author_id"
    has_many :comments
    has_many :articles, through: :comments
    has_many :readings, foreign_key: :reader_id
    has_many :read_articles, through: :readings

    has_secure_password
    validates :email, presence: true, uniqueness: true
    
    def is_staff?
        self.email[-14..-1] == "@newsrail.news"
    end

    def unique_articles_commented
        self.articles.uniq
    end

    def recent_unread_articles
        if self.read_article_ids == []
            Article.recent
        else
            Article.recent.where('id not in (?)', self.read_article_ids)
        end
    end
end
