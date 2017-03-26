authors = (1..20).map do
  Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

books = (1..70).map do
  Book.create(
    title: Faker::Book.title,
    author_id: authors.sample
  )
end

users = (1..10).map do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email
  )
end

(1..300).map do
  BookCopy.create(
    format: rand(1..3),
    published: Faker::Date.between(10.years.ago, Date.today),
    book: books.sample,
    isbn: Faker::Number.number(13)
  )
end
