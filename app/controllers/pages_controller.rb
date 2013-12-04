class PagesController < ApplicationController
	
	def home
		@postsd = Post.where("blog_id = ?", 3).order("created_at Desc").limit(8)
		@postsp = Post.where("blog_id = ?", 1).order("created_at Desc").limit(8)
		@postscb = Post.where("blog_id = ?", 2).order("created_at Desc").limit(8)
	end
end
