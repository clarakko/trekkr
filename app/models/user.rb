class User < ActiveRecord::Base
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: {maximum: 255},
    uniqueness: { case_sensitive: false },
    format: { with: /\A[a-zA-Z0-9]*\z/,
    message: "may only contain letters and numbers." }

  validate :validate_username

   def self.find_for_database_authentication(warden_conditions)
     conditions = warden_conditions.dup
     if login = conditions.delete(:login)
       where(conditions.to_hash)
       .where(["lower(username) = :value OR lower(email) = :value",
         { :value => login.downcase }]).first
     elsif conditions.has_key?(:username) || conditions.has_key?(:email)
       where(conditions.to_hash).first
     end
     conditions[:email].downcase! if conditions[:email]
     where(conditions.to_hash).first
   end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
end
