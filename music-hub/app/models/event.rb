class Event < ApplicationRecord

	belongs_to :user
	belongs_to :artist

	validates :title, {presence: true,length: {maximum: 20}}
	validates :start, presence: true
	validates :end, presence: true
	validates :share, presence: true
	validates :venue, {presence: true,length: {maximum: 30}}
	validates :url, {presence: true,format: /\A#{URI::regexp(%w(http https))}\z/}
	validates :share, {presence: true, length: {maximum: 150}}

	#スケジュールをシェアするかしないか
	enum share: { シェアする:0, シェアしない:1 }
end
