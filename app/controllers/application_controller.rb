class ApplicationController < ActionController::Base
  protect_from_forgery
  #return a title in a per-page basis.
  def title
  	base_title = "Facebook"
  	if @title.nil?
  		base_title
  	else
  		"#{base_title} | #{@title}"
  	end
  end
end
