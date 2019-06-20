class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :comments, through: :posts
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  mount_uploader :avatar, PhotoUploader

  # def send_password_reset

  # end


end
