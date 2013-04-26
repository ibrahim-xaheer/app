module UsersHelper

	def show
		@micropost = current_user.microposts.build if signed_in?
	end

end
