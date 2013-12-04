class UsersController < ApplicationController
	def new
  		@user = User.new 
  	end

  def create
  	@user = User.new(params[:user])
    @user_session = UserSession.new(params[:user_session])
  	if @user.save
     flash[:notice] = "Registration successfull. & you are already login"
  		redirect_to proc { user_url(@user) }
  	else
  		render "new"
  	end
  end
  def show
    @user = User.find(params[:id])
  end
    def edit
      @user = User.find(params[:id]) 
      authorize! :update, @user
    end
    
    def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:notice] ="successfull updated"
        redirect_to proc { user_url(@user) }

      else
        render 'edit'

      end
    end

end
