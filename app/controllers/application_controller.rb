class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :authenticate_user!, only: [:testme]

  def testme

    render json: "Hello #{current_user.email}"
  end

  def authenticate_user!
    return super unless request_authentication_header_value.present?

    @resource = User.where(api_token: request_authentication_header_value).first
    return @resource if @resource

    super
  end

  def request_authentication_header_value
    request.headers["Authorization"]
  end
end
