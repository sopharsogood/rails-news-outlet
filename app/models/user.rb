class User < ApplicationRecord
    # t.string "name"
    # t.string "password_digest"
    # t.string "email"
    # t.string "theme", default: "light"
    # t.string "comment_depth"
    # t.string "bio"
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false

    has_secure_password

    has_many :articles, as: :articles_written
    has_many :comments
    has_many :articles, through: :comments, as: :articles_commented_on

end
