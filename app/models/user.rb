class User < ActiveRecord::Base
  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email.strip.downcase)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end
