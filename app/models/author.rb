class Author < ApplicationRecord
  validates :name, presence: true, uniqness: true
  validates :age, presence: true

  has_may :books, dependent: :destroy
end
