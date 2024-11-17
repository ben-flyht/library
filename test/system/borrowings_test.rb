require "application_system_test_case"

class BorrowingsTest < ApplicationSystemTestCase
  setup do
    @borrowing = borrowings(:one)
  end

  test "visiting the index" do
    visit borrowings_url
    assert_selector "h1", text: "Borrowings"
  end

  test "should create borrowing" do
    visit borrowings_url
    click_on "New borrowing"

    fill_in "Book", with: @borrowing.book_id
    fill_in "Member", with: @borrowing.member_id
    check "Paid" if @borrowing.paid
    click_on "Create Borrowing"

    assert_text "Borrowing was successfully created"
    click_on "Back"
  end

  test "should update Borrowing" do
    visit borrowing_url(@borrowing)
    click_on "Edit this borrowing", match: :first

    fill_in "Book", with: @borrowing.book_id
    fill_in "Member", with: @borrowing.member_id
    check "Paid" if @borrowing.paid
    click_on "Update Borrowing"

    assert_text "Borrowing was successfully updated"
    click_on "Back"
  end

  test "should destroy Borrowing" do
    visit borrowing_url(@borrowing)
    click_on "Destroy this borrowing", match: :first

    assert_text "Borrowing was successfully destroyed"
  end
end
