class Period < ApplicationRecord
	has_many :treatments
	has_many :users, through: :treatments
	has_many :medicines, through: :treatments
end
