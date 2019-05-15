# frozen_string_literal: true

class User < ApplicationRecord
  # associations
  before_create :user_token
  has_many :posts
  validates :username, presence: true, length: { minimum: 6 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  private

  def user_token
    token =  SecureRandom.urlsafe_base64.to_s
    token_en = Digest::SHA1.hexdigest(token)
    self.remember_token = token_en
  end
end
