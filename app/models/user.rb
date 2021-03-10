class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :nickname, precense: true
  # validates :last_name_kanji, precense: true
  # validates :first_name_kanji, precense: true
  # validates :last_name_katakana, precense: true
  # validates :first_name_katakana, precense: true
  # validates :birthday, precense: true
end
