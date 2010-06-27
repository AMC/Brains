class Problem < ActiveRecord::Base
  belongs_to :user

  attr_accessible :title, :desciption, :solution, :user_id
end
