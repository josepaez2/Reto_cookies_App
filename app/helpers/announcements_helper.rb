module AnnouncementsHelper
	# Returns the Gravatar for the given user.
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end
	# def mark_as_seen(announcement)
	# 	cookies.permanent.signed[:announcement_id] = announcement.id
	# end
end
