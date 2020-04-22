class Myrecommend < ApplicationRecord
	belongs_to :user
	belongs_to :recommend
	belongs_to :artist

	validates_uniqueness_of :recommend_id, scope: :user_id
end
