class Reading < ApplicationRecord
    # t.integer "reader_id"
    # t.integer "read_article_id"
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false

    belongs_to :reader, class_name: "User"
    belongs_to :read_article, class_name: "Article"

    validates :reader, presence: true
    validates :read_article, presence: true
end