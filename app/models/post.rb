class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 10, 
        too_short: "Your post must be longer than %{count} characters."} 
    validates :summary, length: { maximum: 100,
        too_long: "Your summary must be shorter than %{count} characters."}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_include

    CLICKBAIT_PATTERNS = [
        "Won't Believe",
        "Secret",
        "Top[number]",
        "Guess"
    ]

    def title_include   
        if title.present? && CLICKBAIT_PATTERNS.none? {|p| title.match(p)}
            errors.add(:title, "title not clickbait-y enough")
        end
    end
end
