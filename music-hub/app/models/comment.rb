class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :recommend
	validates :comment,presence: true
end
