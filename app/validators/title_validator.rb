class TitleValidator < ActiveModel::Validator
    def validate(record)
        unless record.title.include?("Won't Believe", "Secret", "Top", "Guess")
            record.errors[:title] << "Please make your title a little more clickbait-y"
        end
    end
end