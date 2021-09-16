class User < ApplicationRecord
    # t.string "name"
    # t.string "password_digest"
    # t.string "email"
    # t.string "theme", default: "light"
    # t.string "comment_depth"
    # t.string "bio"
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false

    has_many :written_articles, class_name: "Article", foreign_key: "author_id"
    has_many :comments
    has_many :articles, through: :comments

    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :bio, presence: true, length: { maximum: 1000 }

    def is_staff?
        self.email[-14..-1] == "@newsrail.news"
    end
end
