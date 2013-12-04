class Blog < ActiveRecord::Base
   attr_accessible :title, :subdomain, :about, :interest
	has_many :posts
	belongs_to :user

   validates :title, presence: true
   validates :about, length: { maximum: 500 }
   validates :subdomain, presence: true, uniqueness: { case_sensitive: false}
end
