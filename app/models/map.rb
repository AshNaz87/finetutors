class Map < ApplicationRecord
	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	def google_map(center)
		"https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=500x400&zoom=15"
	end
end
