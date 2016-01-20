class User < ActiveRecord::Base
  belongs_to :role
  before_save :encrypt_password

   validates_presence_of :email
   validates_uniqueness_of :email
  validates :password, :presence => true


  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password_confirmation == BCrypt::Engine.hash_secret(password, user.password)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password = BCrypt::Engine.generate_salt
      self.password_confirmation = BCrypt::Engine.hash_secret(password_confirmation, password)
    end
  end

end
