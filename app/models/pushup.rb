class Pushup < ActiveRecord::Base
  validates :amount, :presence => true, :numericality => {:greater_than => 0}
  belongs_to :series
  
  def without_hours
    (created_at.to_i - created_at.to_i%1.day.to_i)*1000
  end
end
