class Event < ActiveRecord::Base
	validates :date, :organizer_name, :organizer_email, presence: true
	validates :organizer_email, :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, :message => "Invalid Email" }
	validates :date, uniqueness: { message: "Event Date has already been taken!"}
	validates :organizer_name, uniqueness: { message: "Title has already been taken!"}
	validate :date_greater

	def date_greater
		unless date.present? && date > Date.today
			errors.add(:date, "Date must be past today!")
		end
	end
end
