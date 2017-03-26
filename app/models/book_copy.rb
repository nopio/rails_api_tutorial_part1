class BookCopy < ApplicationRecord
  belongs_to :book
  belongs_to :user, optional: true

  validates :isbn, :published, :format, :book, presence: true

  HARDBACK = 1
  PAPERBACK = 2
  EBOOK = 3

  enum format: { hardback: HARDBACK, paperback: PAPERBACK, ebook: EBOOK }
end
