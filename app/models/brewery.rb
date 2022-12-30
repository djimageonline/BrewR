class Brewery < ApplicationRecord
  has_many :brewery_tours
  has_many :tours, through: :brewery_tours
  belongs_to :tour
end
