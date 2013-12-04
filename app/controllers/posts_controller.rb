class PostsController < ApplicationController
	def index
		
	end
	def show
		
	end
	def new
		@post = Post.new
		@blogs = current_user.blogs.all
	end
	def create
		@post = Post.new(params[:post])
		@post = Post.create(params[:post])
		if @post.save
			
			flash[:notice] = "your post has been created"
			redirect_to proc { user_url(current_user) }
		else
			 render "new"
		end
	end
	def edit
      @post = Post.find(params[:id]) 
      #authorize! :update, @post
  	end
  	def update 
  		@post = Post.find(params[:id])
  		if @post.update_attributes(params[:post])
  			flash[:notice] = "Picture has been updated"
			redirect_to proc { user_url(current_user) }
		else
			render "edit"
  		end
  	end

	
	def destroy
     @post = Post.find(params[:id])
     	@post.destroy
     	redirect_to current_user, notice: "Successfully destroyed Picture."
     	authorize! :destroy, @post
  	end
end
