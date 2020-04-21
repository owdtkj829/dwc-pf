class Myrecommend < ApplicationRecord
	belongs_to :user
	belongs_to :recommend

	validates_uniqueness_of :recommend_id, scope: :user_id
end
