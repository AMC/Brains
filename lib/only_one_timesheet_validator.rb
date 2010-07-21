class OnlyOneTimesheetValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << "There can be only one" unless thing(record)
  end

private
  def thing(record)
    if record.user
      return !record.user.has_open_timesheet?
    end

  end

end