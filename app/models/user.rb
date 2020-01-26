class User < ApplicationRecord
  
  VALID_PASSWORD_REGEX = /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, presence: true, length: { maximum: 15 }
  
  
  validates :email, presence: true
  validates :email, format: {with: VALID_EMAIL_REGEX}
  
  validates :password, length: { in: 8..32 }
  
  validates :password, format: {with: VALID_PASSWORD_REGEX}
  
  
  
  
  has_secure_password
  
  
  has_many :topics
end
