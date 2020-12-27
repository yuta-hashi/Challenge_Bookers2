class Book < ApplicationRecord
  belongs_to :user
  validates :book_title, :book_body, presence: true

end
