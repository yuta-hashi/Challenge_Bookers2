class User < ApplicationRecord
  validates :username, length: {in: 2..20 }
  validates :username, uniqueness: true
  validates :introducution_id, length: {maximum: 50}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image

end
