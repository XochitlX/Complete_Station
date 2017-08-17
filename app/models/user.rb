class User < ApplicationRecord
	has_many :treatments
	has_many :medicines, through: :treatments
	has_many :periods, through: :treatments
end
