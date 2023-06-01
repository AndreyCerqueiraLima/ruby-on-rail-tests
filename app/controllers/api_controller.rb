class ApiController < ApplicationController
  before_action :doorkeeper_authorize!

  # Skip checking CSRF token authentiity for API requests.
  skip_before_action :verify_authenticity_token

  # Set response type
  respond_to :json

  private

  #helper method to access the current user from the token
  def current_user
    @current_user ||= User.find_by(id: doorkeeper_token[:resouce_owner_id])
  end


end