class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    validate :must_be_clickbait_title

    def must_be_clickbait_title
        
        title_strings = Array["Won't Believe", "Secret", "Top [number]", "Guess"]
        
        if title && title_strings.none? {|check_title| title.include?(check_title)}
            errors.add(:bait_error, "Title must be clickbait.")
        end
    end


end
