class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :blog_id
      t.string :url
      t.integer :picture_file_size
      t.string :picture_content_type
      t.string :picture_file_name
      t.datetime :picture_updated_at

      t.timestamps
    end
    add_index :posts, :blog_id
  end
end
