class Borrowing < ApplicationRecord
  BORROWING_PERIOD = 14.days.freeze
  BORROWING_LIMIT = 3.freeze

  belongs_to :member
  belongs_to :book

  validate :book_is_available, on: :create
  validate :member_is_under_borrowing_limit, on: :create
  validate :member_has_no_overdue_books, on: :create
  validate :member_has_no_outstanding_fees, on: :create
  validate :member_has_no_duplicate_isbns, on: :create

  before_destroy :validate_borrowing_is_paid

  scope :overdue, -> { where('created_at <= ?', Time.current - BORROWING_PERIOD) }
  scope :unpaid, -> { where(paid: false) }

  delegate :borrowings, :borrowed_isbns, to: :member, prefix: true
  delegate :available?, to: :book, prefix: true

  alias return destroy

  def pay
    update(paid: true)
  end

  private

  def book_is_available
    return if book_available?

    errors.add(:book, "is not available")
  end

  def member_is_under_borrowing_limit
    return if member_borrowings.count < BORROWING_LIMIT

    errors.add(:member, "has reached the borrowing limit")
  end

  def member_has_no_overdue_books
    return if member_borrowings.overdue.none?

    errors.add(:member, "has overdue books")
  end

  def member_has_no_outstanding_fees
    return if member_borrowings.unpaid.none?

    errors.add(:member, "has outstanding fees")
  end

  def member_has_no_duplicate_isbns
    return if member_borrowed_isbns.exclude?(book.isbn)

    errors.add(:member, "has already borrowed this book")
  end

  def validate_borrowing_is_paid
    return if paid?

    errors.add(:base, "you can't return this before you've paid for it")
    throw(:abort)
  end
end
