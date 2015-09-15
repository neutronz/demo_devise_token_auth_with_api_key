class User < ActiveRecord::Base
  devise :database_authenticatable,
          :registerable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  def token_validation_response
    UserSerializer.new(self).to_json
  end

  def password_required?
    return super unless self.provider == "api"
    false
  end

  def password_changed?
    return super unless self.provider == "api"
    false
  end

end
