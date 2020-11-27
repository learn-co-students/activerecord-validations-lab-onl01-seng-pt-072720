class ClickbaitValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /(Won't Believe|Secret|Top \d|Guess)/
        record.errors[attribute] << ("Not a clickbait title")
      end
    end
end

class Post < ActiveRecord::Base
    validates :title, presence: true, clickbait: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    # validate :clickbait, on: :title

    # def clickbait 
    #     errors.add(:title, "is not valid") unless :title == "Won't Believe"
    # end 
end