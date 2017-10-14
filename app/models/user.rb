# User model
class User < ApplicationRecord
  has_secure_password
  # http://www.aidanf.net/posts/validating-emails-in-rails
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :email,    presence: true, uniqueness: { case_sensitive: false },
                       format: { with: EMAIL_REGEX }
  validates :nickname, presence: true, length: { minimum: 8, maximum: 32 }
  validates :password, presence: true, length: { minimum: 8 }, on: :create
end
