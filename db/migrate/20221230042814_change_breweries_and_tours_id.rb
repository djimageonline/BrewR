class ChangeBreweriesAndToursId < ActiveRecord::Migration[7.0]
  def change
    remove_column :brewery_tour, :breweries_id, :integer
    remove_column :brewery_tours, :tours_id, :integer
    add_column :brewery_tours, :brewery_id, :integer
    add_column :brewery_tours, :tour_id, :integer
  end
end
