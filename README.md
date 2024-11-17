# README

## Steps to run the project

1. Clone the project
2. Run `bundle install`
3. Run `rails db:create`
4. Run `rails db:migrate`
5. Run `rails db:seed`

## Example actions

1. Borrow a book
```ruby
book = Book.first
member = Member.first
Borrowing.create(book: book, member: member)
```
2. Pay for a borrowed book
```ruby
borrowing = Borrowing.first
borrowing.pay
```
3. Return a book
```ruby
borrowing = Borrowing.first
borrowing.return
```
