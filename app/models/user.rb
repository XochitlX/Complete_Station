class User < ApplicationRecord
	before_save { name.downcase! }
	has_many :treatments
	has_many :medicines, through: :treatments
	has_many :periods, through: :treatments
	has_many :reminders

	validates :name, presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }

	validates :phone_number, 
				presence: true, length: { maximum: 10 }#,
				#uniqueness: true

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
