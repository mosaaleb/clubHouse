class User < ApplicationRecord
  before_create :user_token
  has_secure_password

  private
    def user_token
      token = SecureRandom.urlsafe_base64.to_s
      token_en = token.Digest::SHA1.hexdigest
      user.remember_token = token_en
    end
end
