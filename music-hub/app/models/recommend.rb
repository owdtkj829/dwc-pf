class Recommend < ApplicationRecord
	belongs_to :user
	belongs_to :artist
	has_many :myrecommends, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :artistname, {presence: true,length: {maximum: 20}}
	validates :song, {presence: true,length: {maximum: 20}}
	validates :url, presence: true
	validates :explanation, {presence: true,length: {maximum: 150}}
end
