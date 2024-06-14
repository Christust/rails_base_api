class User < ApplicationRecord
	has_secure_password

	validates :name, presence: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

	enum user_type: {superadmin: 1, admin: 2, common: 3}


end
