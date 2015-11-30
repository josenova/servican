class Breed < ActiveRecord::Base
  belongs_to :species
  has_many :patients


  validates :name, presence: true
  validates :species, presence: true
 

end
