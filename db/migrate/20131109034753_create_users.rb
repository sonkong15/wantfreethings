class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.boolean :admin
    	t.string :address
    	t.string :state
    	t.string :city
    	t.integer :zipcode
    	t.string :facebook_uid
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
