class DateFormatValidator < ActiveModel::EachValidator
    DATE_REGEX = /\A\d{4}-\d{2}-\d{2}\z/
  
    def validate_each(record, attribute, value)
      # Convert to string if the value is a Date object
      value = value.to_s if value.is_a?(Date)
  
      unless value =~ DATE_REGEX && valid_date?(value)
        record.errors.add(attribute, (options[:message] || "This Date is not in the correct format"))
      end
    end
  
    private
  
    def valid_date?(value)
      Date.iso8601(value)
      true
    rescue ArgumentError
      false
    end
  end