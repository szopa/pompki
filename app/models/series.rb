class Series < ActiveRecord::Base
  belongs_to :user
  has_many :pushups, :dependent => :destroy
  accepts_nested_attributes_for :pushups, :reject_if => lambda { |a| a[:amount].blank?}, :allow_destroy => true
  def without_hours
    (created_at.to_i - created_at.to_i%1.day.to_i)*1000
  end
end
