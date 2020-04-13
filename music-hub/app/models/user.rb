class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :artists
  has_many :schedules, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recommends
  has_many :myrecommends, dependent: :destroy
  has_many :comments, dependent: :destroy
end
