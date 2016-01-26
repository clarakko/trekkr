class Trek < ActiveRecord::Base
  has_many :steps
  has_many :challenges, through: :steps
  has_many :reports
  validates :title, presence: true, uniqueness: true
  validates :location, presence: true
  validates :description, presence: true

  def to_partial_path
    'treks/trek'
  end
end
