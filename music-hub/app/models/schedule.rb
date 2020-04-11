class Schedule < ApplicationRecord

	belongs_to :user
	belongs_to :artist

	#スケジュールをシェアするかしないか
	def if_share
		yuukou = "シェアする"
		mukou = "シェアしない"
		if true == share
			yuukou
		else
			mukou
		end
	end
end
