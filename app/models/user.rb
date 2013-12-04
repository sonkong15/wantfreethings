class User < ActiveRecord::Base
  	attr_accessible :first_name, :email, :last_name, :password, :password_confirmation, :facebook_link,
	:state,:address, :admin, :facebook_uid, :city, :zipcode, :user_token, :expires_at
	has_many :uploads
	has_many :comments
  	has_many :blogs
    #acts_as_voter
	#make_flagger 

	acts_as_authentic do |c|
    c.act_like_restful_authentication = true
	end

	before_save { |user| user.email = email.downcase }

	validates :first_name, presence: true, length: { maximum: 30 }
	
	

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates_presence_of(:email)
	validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
	validates :password, presence: true, length: { minimum: 6 }, :on => :create
	validates :password_confirmation, presence: true, :on => :create
	

	def self.find_or_create_from_oauth(auth_hash)
	    provider = auth_hash["provider"]
	    uid = auth_hash["uid"]
		case provider
	      when 'facebook'
	        if user = self.find_by_email(auth_hash["info"]["email"])
	          user.update_user_from_facebook(auth_hash)
	          return user
	        elsif user = self.find_by_facebook_uid(uid)
	          return user
	        else
	          return self.create_user_from_facebook(auth_hash)
	        end
	      when 'twitter'
	        if user = self.find_by_twitter_uid(uid)
	          return user
	        else
	          return self.create_user_from_twitter(auth_hash)
	        end
		end
  	end
  
  def self.create_user_from_twitter(auth_hash)
    self.create({
      :twitter_uid => auth_hash["uid"],
      :name => auth_hash["info"]["name"],
      :image_url => auth_hash["info"]["image"],
      :crypted_password => "twitter",
      :password_salt => "twitter",
      :persistence_token => "twitter"
    })
    
  end
  
  def self.create_user_from_facebook(auth_hash)
    self.create({
      :facebook_uid => auth_hash["uid"],
      :name => auth_hash["info"]["name"],
      :image_url => auth_hash["info"]["image"],
      :email => auth_hash["info"]["email"],
      :crypted_password => "facebook",
      :password_salt => "facebook",
      #:user_token => auth_hash['credentials']['token'],
      #:expires_at => auth_hash['credentials']['expires_at'],
      :persistence_token => "facebook"
    })
  end
  
  def image
    :image_url || "http://placehold.it/48x48"
  end
  
  def password_required?
    facebook_uid.blank? && twitter_uid.blank?
  end
  
  def email_available?
    twitter_uid.blank?
  end
  
  def update_user_from_facebook(auth_hash)
    self.update_attributes({
      :facebook_uid => auth_hash["uid"],
      :image_url => auth_hash["info"]["image"],
      #:user_token => auth['credentials']['token'],
      #:expires_at => auth_hash['credentials']['expires_at']
    })
  end
  

end
