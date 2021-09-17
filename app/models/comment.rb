class Comment < ApplicationRecord
    # t.text "content"
    # t.integer "user_id"
    # t.integer "article_id"
    # t.integer "parent_id"
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false

    belongs_to :user
    belongs_to :article

    has_many :children, class_name: "Comment", foreign_key: "parent_id"
    belongs_to :parent, class_name: "Comment", optional: true

    validates :content, presence: true, length: { maximum: 5000 }
    validates :article_id, presence: true
    validates :user_id, presence: true
    validate :parent_and_article_must_match

    def has_parent?
        !self.parent_id.nil?
    end

    def parent_and_article_must_match
        if self.parent && self.parent.article_id != self.article_id
            errors.add(:parent, "if present, must be on same article as new comment")
        end
    end

    def true_depth
        if self.parent
            self.parent.true_depth + 1
        else
            0
        end
    end
end
