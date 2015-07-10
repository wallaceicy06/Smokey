class User < ActiveRecord::Base
  def generate_auth_token
    payload = { user_id: self.id, username: self.username }
    AuthToken.encode(payload)
  end
end
