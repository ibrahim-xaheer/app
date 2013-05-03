class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  #Force Sign out to pre
  def handle_unverified_request
  	sign_out
  end
  
  
end
#<div class="span10">
#  <%= debug(params) if Rails.env.development? %>
#</div>
