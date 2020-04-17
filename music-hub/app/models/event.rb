class Event < ApplicationRecord
	
	belongs_to :user
	belongs_to :artist

	#スケジュールをシェアするかしないか
	enum share: { シェアする:0, シェアしない:1 }
end
