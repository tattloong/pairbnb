class Listing < ApplicationRecord
	belongs_to :user

	mount_uploader :image, ImageUploader
	has_many :reservations
	has_many :booked_users, through: :reservations, source: :user


	
end
