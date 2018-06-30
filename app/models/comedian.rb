class Comedian < ActiveRecord::Base
  has_many :specials
  
  validates :name, presence: true
  validates :age, presence: true

  def self.avg_age
    average(:age)
  end

  def specials_count
    specials.length
  end
end
