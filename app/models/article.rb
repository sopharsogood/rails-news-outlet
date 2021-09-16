class Article < ApplicationRecord
    # t.string "title"
    # t.text "content"
    # t.integer "author_id"
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false

    belongs_to :author, class_name: "User"
    has_many :comments
    has_many :users, through: :comments

    validates :title, presence: true
    validates :content, presence: true
    validate :author_is_staff

    def author_is_staff
        puts self.author
        puts self.author.email
        puts self.author.email[-14..-1]
        puts self.author.is_staff?
        self.author && self.author.is_staff?
    end
end
