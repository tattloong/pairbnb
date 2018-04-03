class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
    	t.integer :user_id
    	t.string :property_name
    	t.string :room_type
    	t.string :total_guest
    	

      t.timestamps
    end
  end
end
