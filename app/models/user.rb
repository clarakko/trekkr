class User < ActiveRecord::Base
  has_merit

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :entries
  has_many :challenges, through: :entries
  has_many :reports

  validates :username, presence: true,
    length: { maximum: 255 },
    uniqueness: { case_sensitive: false },
    format: { with: /\A[a-zA-Z0-9]*\z/,
      message: "may only contain letters and numbers."
    }

  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
end
