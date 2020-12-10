class NameValidator < ActiveModel::Validator
    def validate(record)
        if record.name == nil
            record.errors[:name] << "Sorry, a name has to be present!!"
        end
    end
end