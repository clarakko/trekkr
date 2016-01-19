class Challenge < ActiveRecord::Base
  has_many :entries
  has_many :users, through: :entries

  validates :title, presence: true, uniqueness: true
  validates :tagline, presence: true
  validates :description, presence: true

  def to_partial_path
    'challenges/challenge'
  end
end
