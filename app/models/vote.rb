class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
  belongs_to :user

  attr_accessible :value, :user_id, :voteable_id, :voteable_type
  validates_uniqueness_of :user_id, :scope => [:voteable_id, :voteable_type]
  validates :voteable_type, :voteable_id, :presence => :true
end
