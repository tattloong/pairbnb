class AddColumnToListings < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings, :more_description, :text
  end
end
