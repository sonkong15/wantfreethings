class AddUrlToPost < ActiveRecord::Migration
  def change
    add_column :posts, :urlpic, :text
    add_column :posts, :active, :boolean
  end
end
