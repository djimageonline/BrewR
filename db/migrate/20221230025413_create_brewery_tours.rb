class CreateBreweryTours < ActiveRecord::Migration[7.0]
  def change
    create_table :brewery_tours do |t|
      t.integer :brewery_id
      t.integer :tour_id

      t.timestamps
    end
  end
end
