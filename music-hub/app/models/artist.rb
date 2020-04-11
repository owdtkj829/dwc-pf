class Artist < ApplicationRecord
	attachment :image
	
	belongs_to :user
	has_many :schedules
	has_many :favorites, dependent: :destroy

	validates :name ,presence: true
    validates :explanation ,presence: true
    validates :image ,presence: true
end
