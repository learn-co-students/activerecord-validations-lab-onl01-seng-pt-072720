class TitleValidator < ActiveModel::Validator
    def validate(record)
        clickbait = false
        clickbait_titles = ["Won't Believe", "Secret", "Top", "Guess"]
        clickbait_titles.each do |cb|
            if record.title && record.title.include?(cb)
                clickbait = true
            end
        end
        if !clickbait
            record.errors[:title] << "Title must be sufficiently clickbait-y."
        end
    end
end