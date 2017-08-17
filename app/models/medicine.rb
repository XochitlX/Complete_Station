class Medicine < ApplicationRecord
	has_many :treatments
	has_many :users, through: :treatments
	has_many :periods, through: :treatments
end
