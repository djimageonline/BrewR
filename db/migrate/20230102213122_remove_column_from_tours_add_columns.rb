class RemoveColumnFromToursAddColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :tours, :brewery_id, :integer
    add_column :tours, :date, :date
    add_column :tours, :name, :string    
  end
end
