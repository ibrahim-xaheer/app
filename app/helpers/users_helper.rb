module UsersHelper
	def plural(num, word)
		if num==1
			return num + " " + word
		else
			return num + " " + word + "s"
		end
	end
end
