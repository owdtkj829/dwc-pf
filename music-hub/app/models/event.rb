class Event < ApplicationRecord

	belongs_to :user
	belongs_to :artist

	validates :title, {presence: true,length: {maximum: 20}}
	validates :start, presence: true
	validates :end, presence: true
	validate :start_end_check
	validates :share, presence: true
	validates :venue, {presence: true,length: {maximum: 30}}
	validates :url, {presence: true,format: /\A#{URI::regexp(%w(http https))}\z/}
	validates :memo, {presence: true, length: {maximum: 150}}

	#スケジュールをシェアするかしないか
	enum share: { シェアする:0, シェアしない:1 }

  	def start_end_check
    	errors.add(:end, "の日付を正しく記入して下さい。") unless
    	self.start < self.end
  	end
end
