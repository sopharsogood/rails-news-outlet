class Article < ApplicationRecord
    # t.string "title"
    # t.text "content"
    # t.integer "author_id"
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false

    belongs_to :author, class_name: "User"
    has_many :comments
    has_many :users, through: :comments
    has_many :readings
    has_many :readers, through: :readings

    validates :title, presence: true
    validates :content, presence: true
    validate :author_is_staff

    def author_is_staff
        unless self.author && self.author.is_staff?
            errors.add(:author, "must work at newsrail")
        end
    end

    def author_bio
        self.author.bio
    end

    def top_level_comments
        self.comments.where(parent_id: nil)
    end
end
