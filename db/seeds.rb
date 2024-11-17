# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Member.create(name: 'Ben Morrison')

Book.create(title: 'The Great Gatsby', isbn: '978-3-16-148410-0')
Book.create(title: 'The Catcher in the Rye', isbn: '978-3-16-148410-1')
Book.create(title: 'To Kill a Mockingbird', isbn: '978-3-16-148410-2')
Book.create(title: '1984', isbn: '978-3-16-148410-3')
Book.create(title: '1984', isbn: '978-3-16-148410-3')
Book.create(title: 'Pride and Prejudice', isbn: '978-3-16-148410-4')
