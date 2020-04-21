class Artist < ApplicationRecord
	attachment :image

	belongs_to :user
	has_many :events
	has_many :favorites, dependent: :destroy
	has_many :recommends, dependent: :destroy

	validates :name ,{presence: true, length: {maximum: 20}}
    validates :explanation ,{presence: true, length: {maximum: 150}}
    validates :image ,presence: true

    def self.artist_serach(search)
    	Artist.where(['name LIKE ?', "%#{search}%"])
	end
end
