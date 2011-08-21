class Series < ActiveRecord::Base
  belongs_to :user
  has_many :pushups, :dependent => :destroy
  accepts_nested_attributes_for :pushups
end
