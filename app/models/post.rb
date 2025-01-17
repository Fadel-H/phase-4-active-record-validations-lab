class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait

    def clickbait
        unless title.present? && title.include?("Won't Believe" || "Secret" || "Top [\d]" || "Guess")
            errors.add(:title, "Gotta work on your clickbaity title!")
        end
    end
end
