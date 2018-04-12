class AddImageFileNameToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :image_filename, :string
  end
end
