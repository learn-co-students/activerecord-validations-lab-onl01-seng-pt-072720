class NameValidator < ActiveModel::Validator 
    def validate(record)
        unless record.name
    end 
end 