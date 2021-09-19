class Condition < ApplicationRecord
  belongs_to :user
  validates :temperature, presence: true
end
