class Step < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :trek

  validates :challenge, presence: true, uniqueness: { scope: :trek }
  validates :trek, presence: true, uniqueness: { scope: :challenge }
end
