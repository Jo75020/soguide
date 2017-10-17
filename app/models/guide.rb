class Guide < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  def display_name
  return "#{self.id.to_s} -  #{self.user.first_name} #{self.user.last_name} - #{self.user.inscription_reason}"
  end
end
