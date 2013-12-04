class BlogsController < ApplicationController
	def index
		
	end
	def show
		
	end
	def new
		@blog = Blog.new
	end
	def create
		@blog = Blog.new(params[:blog])
		@blog = current_user.blogs.create(params[:blog])
		if @blog.save
			
			flash[:notice] = "your wedsite has been created"
			redirect_to proc { user_url(current_user) }
		else
			 render "new"
		end
	end
	def edit
      @blog = Blog.find(params[:id]) 
      authorize! :update, @blog
  	end
  	def update 
  		@blog = Blog.find(params[:id])
  		if @blog.update_attributes(params[:blog])
  			flash[:notice] = "website has been updated"
			redirect_to proc { user_url(current_user) }
		else
			render "edit"
  		end
  	end

	
	def destroy
     @blog = Blog.find(params[:id])
     	@blog.destroy
     	redirect_to current_user, notice: "Successfully destroyed Picture."
     	authorize! :destroy, @blog
  	end
end
