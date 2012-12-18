class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :country, :date_of_birth
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A[A-Za-z0-9]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5, maximum: 8 }, format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, presence: true   
  validates :country, presence: true 
  validates :date_of_birth, presence: true   

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end       
end
