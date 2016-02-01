class Patient < ActiveRecord::Base
  belongs_to :client
  belongs_to :breed
  has_many :appointments

  before_validation do
    self.name = name.strip.downcase.split.map(&:capitalize).join(" ") if name.present?
  end


  validates :name, presence: true
  #validates :gender, presence: true
  validates :breed, presence: true
  validates :client, presence: true

end
