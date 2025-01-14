class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait_title
    
    def clickbait_title
        if title
            unless title.downcase.include? "won't believe"
                errors.add(:title, "Not clickbaity")
            end
        end
    end
end
