class StartBeforeEndValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << "end date must come after start date" unless thing(record)
  end

private
  def thing(record)
    record.end_time.nil? || record.start_time < record.end_time 
  end

end