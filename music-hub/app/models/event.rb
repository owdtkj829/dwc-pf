class Event < ApplicationRecord

	belongs_to :user
	belongs_to :artist

	validates :title, {presence: true,length: {maximum: 20}}
	validates :start, presence: true
	validates :end, presence: true
	validates :share, presence: true
	validates :venue, {presence: true,length: {maximum: 30}}
	validates :url, {presence: true,format: /\A#{URI::regexp(%w(http https))}\z/}
	validates :memo, {presence: true, length: {maximum: 150}}
	validate :start_end_check
	
	#スケジュールをシェアするかしないか
	enum share: { シェアする:0, シェアしない:1 }

  	def start_end_check
    	errors.add(:end, "を正しく記入してください。") unless
    	self.start < self.end
  	end
end
