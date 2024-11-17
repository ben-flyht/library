class Book < ApplicationRecord
  has_one :borrowing
  has_one :member, through: :borrowing

  validates :title, presence: true
  validates :isbn, presence: true, uniqueness: true

  def available?
    !borrowing.persisted?
  end
end
