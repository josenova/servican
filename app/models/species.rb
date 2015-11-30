class Species < ActiveRecord::Base
	has_many :breeds

	validates :name, presence: true
end
