class Patient < ActiveRecord::Base
  belongs_to :client
  belongs_to :breed
  has_many :appointments


  validates :name, presence: true
  #validates :gender, presence: true
  validates :breed, presence: true
  validates :client, presence: true

end
