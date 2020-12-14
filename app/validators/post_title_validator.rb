class PostTitleValidator < ActiveModel::Validator
  def validate(record)
    unless  record.title.present?  && record.title.match?(/Won't Believe| Secret |Top [number] |Guess/)
      record.errors[:title] << "Not clickbait-y!"
  end
end

end
