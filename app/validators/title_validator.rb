class titleValidator < ActiveModel::Validator
    def validate(record)
        valid_titles = [/Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/]
        unless record.title.match?(valid_titles)
            record.errors[:title] << "Not click-baity enough"
        end
    end
end
