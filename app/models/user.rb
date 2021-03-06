class User < ApplicationRecord
  has_one :rest_key, dependent: :destroy
  has_one :photo, dependent: :destroy
  
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 144}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 8 }
end
