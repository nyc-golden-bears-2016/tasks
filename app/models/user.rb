class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :password, length: {minimum: 8}

  has_many :tasks

  has_secure_password

  # def password
  #   @password ||= BCrypt::Password.new(self.password_digest)
  # end

  # def password=(plaintext_password)
  #   @password = BCrypt::Password.create(plaintext_password)
  #   self.password_digest = @password
  # end
end
