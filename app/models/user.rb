class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 6}
  validates :password_confirmation, presence: true


  def self.authenticate_with_credentials(email, password)
    
    @user = User.find_by_email(email.strip.downcase)
    
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end

  end

end
