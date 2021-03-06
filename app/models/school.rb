class School < ActiveRecord::Base
  has_many :classrooms
  
  def self.by_name
    order(:name)
  end

  def self.by_level
    order(:level)
  end

  def info
    "The school #{self.name}, serves those of #{self.level} age."
  end
end
