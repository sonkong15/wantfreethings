class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
    	t.string :subdomain
    	t.integer :user_id
    	t.text :about
    	t.string :title
    	t.string :gender
    	t.integer :min_age
    	t.integer :max_age
    	t.string :interest
		t.string :avatar_file_name
    	t.string :avatar_content_type
    	t.integer :avatar_file_size

      t.timestamps
    end
    add_index :blogs, :subdomain, unique: true
    add_index :blogs, :user_id
  end
end
