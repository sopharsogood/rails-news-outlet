class Article < ApplicationRecord
    # t.string "title"
    # t.text "content"
    # t.integer "author_id"
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false

    belongs_to :author, class_name: "User"
    has_many :comments
    has_many :users, through: :comments
end
