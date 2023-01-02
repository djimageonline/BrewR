class RemoveBreweryTourIdColumnToTour < ActiveRecord::Migration[7.0]
  def change
    remove_column :tours, :brewery_tour_id, :integer
    add_column :tours, :brewery_id, :integer
  end
end
