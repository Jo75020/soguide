class Review < ApplicationRecord
  belongs_to :guide
  belongs_to :user
end
