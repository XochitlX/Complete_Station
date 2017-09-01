class Medicine < ApplicationRecord
	has_many :treatments
	has_many :users, through: :treatments
	#has_many :periods, through: :treatments
	has_many :events, through: :treatments

	def start
		p "dentro start Medicineeee" * 20
	end
end
