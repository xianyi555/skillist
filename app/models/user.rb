class User < ApplicationRecord

  has_many :skills, dependent: :destroy
  has_secure_password

  has_attached_file :avatar, styles: { small: "64x64", med: "100x100", large: "300x300" }, default_url: "default_profile.png"
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  validates :firstname, presence: true, length: { maximum: 255 }
  validates :lastname, presence: true, length: { maximum: 255 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, length: { maximum: 255 }
  validates :password, presence: true, length: {within: 6..40}, :if => :password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end

end
