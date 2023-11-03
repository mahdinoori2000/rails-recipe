class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :foods
  has_many :recipes

  validates :name, presence: true
  validates :email, presence: true, allow_blank: false
  validates :encrypted_password, presence: true, allow_blank: false
end
