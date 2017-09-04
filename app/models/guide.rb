class Guide < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
