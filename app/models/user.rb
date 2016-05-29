class User < ActiveRecord::Base
  def self.find_or_create_from_auth(auth)
    User.find_or_create_by(
      provider: auth["provider"],
      name: auth["info"]["id"]
    )
  end
end
