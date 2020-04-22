class Artist < ApplicationRecord
	attachment :image

	belongs_to :user
	has_many :events
	has_many :favorites
	has_many :recommends, dependent: :destroy
	has_many :myrecommends, dependent: :destroy

	validates :name ,{presence: true, length: {maximum: 20}}
    validates :explanation ,{presence: true, length: {maximum: 150}}

    def self.artist_serach(search)
    	Artist.where(['name LIKE ?', "%#{search}%"])
	end
end
