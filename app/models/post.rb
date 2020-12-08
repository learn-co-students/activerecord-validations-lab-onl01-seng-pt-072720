class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
   
#   validate :is_clickbait?

#     def is_clickbait?
#     if self.title.nil? ||!self.title.include?("Won't Believe") || !self.title.include?("Secret") || !self.title.include?("Top ") || !self.title.include?("Guess") 
#         errors.add(:title, "not clickbaity enough!")  
#     end
#   end
end

# All posts have a title
# Post content is at least 250 characters long
# Post summary is a maximum of 250 characters
# Post category is either Fiction or Non-Fiction This step requires an inclusion validator
# "Won't Believe", "Secret", "Top [number]", or "Guess"