class Author < ApplicationRecord
  validates :name, presence: true
  
  validates :age, presence: true

  has_many :books, dependent: :destroy
end
