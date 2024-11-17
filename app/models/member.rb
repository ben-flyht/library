class Member < ApplicationRecord
  has_many :borrowings
  has_many :books, through: :borrowings

  validates :name, presence: true

  def borrowed_isbns
    books.map(&:isbn)
  end
end
