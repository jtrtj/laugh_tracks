class Comedian < ActiveRecord::Base
  has_many :specials
  
  validates :name, presence: true
  validates :age, presence: true
end
