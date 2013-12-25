class Post < ActiveRecord::Base
  attr_accessible :blog_id, :body, :title, :url, :urlpic, :active
  #validates :url, uniqueness: true, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  
  validates :urlpic, presence: true

end
