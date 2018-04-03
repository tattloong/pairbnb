class AddColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings, :country, :string
  end
end
