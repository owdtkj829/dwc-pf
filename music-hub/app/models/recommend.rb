class Recommend < ApplicationRecord
	belongs_to :user
	has_many :myrecommends, dependent: :destroy
	has_many :comments, dependent: :destroy
end
