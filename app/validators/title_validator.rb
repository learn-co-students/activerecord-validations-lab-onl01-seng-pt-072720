class TitleValidator < ActiveModel::Validator
  ActiveModel::Validator


  def validate(record)
    arr = ["Won't Believe", "Secret", "Top [number]","Guess"]

    if record.title
      unless arr.any? { |word| record.title.include?(word) }
        record.errors[:title] << "invalid title"
      end
    end
  end

end