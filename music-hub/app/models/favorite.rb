class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :artist

	validates_uniqueness_of :artist_id, scope: :user_id
end
