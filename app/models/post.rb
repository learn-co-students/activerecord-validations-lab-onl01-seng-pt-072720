class Post < ActiveRecord::Base
    validates :title, presence: true
    validate :click_baity
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

   private
   
    def click_baity
        if title
            if title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess") || title.include?("Secret") || title.include?("Top") || title.include?("Guess")
                @post 
            else
                errors.add(:title, "isn't click baity enough!") 
            end
        end
    end
    

    
end
