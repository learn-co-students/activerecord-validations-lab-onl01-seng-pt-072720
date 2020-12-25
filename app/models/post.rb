class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    # validates :category, inclusion: { in: %w(Fiction Non-fiction), message: "%{value} is not a valid category" }
    validates :category, inclusion: ["Fiction", "Non-fiction"]

    validate :is_clickbait?

    CLICKBAIT_PATTERNS = [
        "Won't Believe",
        "Secret",
        "Top[number]",
        "Guess"
    ]

    def is_clickbait?
        if title.present? && CLICKBAIT_PATTERNS.none? {|p| title.match(p)}
            errors.add(:title, "title must be clickbait")
        end
    end


end
