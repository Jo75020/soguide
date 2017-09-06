class Review < ApplicationRecord
  belongs_to :guide
  belongs_to :user
  validates :content, length: { minimum: 3 }, presence: true
end
