require 'bcrypt'
class User < ApplicationRecord
  validates :email, presence:true, uniqueness: {case_sensitivity: false}
  #include BCrypt OR BCrypt::Password.create in password=value method
  #BCrypt::Password.create(value) doesn't create string even though its ""

  def password=(value)
    @password = value
    self.password_digest = BCrypt::Password.create(value)
  end

  def password
    @password
  end

  def valid_password?(current_password)
    #"asdfasfsd!4324f" == "asdf"
    # In other words, Hash digest == value
    #check the github page
    BCrypt::Password.new(password_digest) == current_password
  end
end
