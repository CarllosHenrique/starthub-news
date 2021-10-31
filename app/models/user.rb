class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :news, dependent: :destroy

  validates :nickname, format: {  without: /\s/, message: "Não pode espaço" } 
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
