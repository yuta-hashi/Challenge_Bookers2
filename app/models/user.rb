class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image

  # インスタンスメソッド
  def User.user_info
    user = user.find()
  end
end
