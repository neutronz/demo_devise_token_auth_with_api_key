class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  def token_validation_response
    UserSerializer.new(self).to_json
  end
end
