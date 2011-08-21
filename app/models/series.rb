class Series < ActiveRecord::Base
  belongs_to :user
  has_many :pushups
end
