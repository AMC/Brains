class Problem < ActiveRecord::Base

  has_many :comments, :as=> :commentable
  
  belongs_to :user
  
  acts_as_taggable

end
