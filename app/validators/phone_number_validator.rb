class PhoneNumberValidator < ActiveModel::Validator
    def validate(record)
        if record.phone_number.length < 10
            record.errors[:name] << "Sorry, the phone number has to be the correct length!"
        end
    end
end