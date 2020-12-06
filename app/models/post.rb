class Post < ActiveRecord::Base
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w( Fiction Non-Fiction)}
    validate :title_is_click_bait
    validates :title, presence: true 

    def title_is_click_bait
        if self.title
            regex = /(Won't Believe)|(Secret)|(Top)[0-9]|(Guess)/
            if !self.title.match(regex)
                errors.add(:title, "is not clickbait")
            end
        end
    end


end
