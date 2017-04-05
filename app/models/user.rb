class User < ActiveRecord::Base

  def self.find_or_create_from_auth_hash(auth_hash)
    token = auth_hash.fetch(:credentials, {}).fetch(:token)
    return if !token
    User.find_or_create_by(token: token)
  end
end
