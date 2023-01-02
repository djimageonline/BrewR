class AddBreweryTourColumnToTour < ActiveRecord::Migration[7.0]
  def change
    add_column :tours, :brewery_tour_id, :integer
  end
end
