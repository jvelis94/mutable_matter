class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments, through: :posts
  has_many :replies, through: :comments
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  mount_uploader :avatar, PhotoUploader

  # def send_password_reset

  # end


end
