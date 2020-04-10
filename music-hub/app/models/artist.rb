class Artist < ApplicationRecord
	attachment :image
	
	belongs_to :user
	has_many :schedules

	validates :name ,presence: true
    validates :explanation ,presence: true
    validates :image ,presence: true
end
