class Vote < ActiveRecord::Base
  belongs_to :votable, :polymorphic => true
  belongs_to :user

  attr_accessible :value, :votable_id, :user_id, :votable_type
end
