class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, 
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :firstname, :lastname, :zipcode, :token, :password, :password_confirmation, :remember_me
  
  validates_presence_of :firstname, :lastname, :zipcode
  validates_format_of :zipcode, :with => /^\d{5}(-\d{4})?$/, :message => "should be valid"
  
  before_create :generate_token

  protected

  def generate_token
    begin
      token = "c" + SecureRandom.hex(3)
    end while User.where(:token => token).exists?
    self.token = token
  end

end
