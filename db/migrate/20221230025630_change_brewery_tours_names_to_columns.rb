class ChangeBreweryToursNamesToColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :brewery_tours, :brewery_id, :integer
    remove_column :brewery_tours, :tour_id, :integer
    add_column :brewery_tours, :breweries_id, :integer
    add_column :brewery_tours, :tours_id, :integer
  end
end
