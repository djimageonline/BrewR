class Tour < ApplicationRecord
  belongs_to :user
  has_many :brewery_tours
  has_many :breweries, through: :brewery_tours
end
