class FutureDateValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    if value
      if value > Time.now + 5
        object.errors[attribute] << (options[:message] || "Must not be a future time") 
      end
    end
  end
end