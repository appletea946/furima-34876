class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: /\A[一-龥々]+\z/, message: 'には、全角漢字を使用してください' } do
      validates :last_name_kanji
      validates :first_name_kanji
    end

    with_options format: { with: /\A[ァ-ヶ]+\z/, message: 'には、全角カタカナを使用してください' } do
      validates :last_name_katakana
      validates :first_name_katakana
    end
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英数字の両方を含めて設定してください'
end
