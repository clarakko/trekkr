class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge

  validates :user, presence: true, uniqueness: { scope: :challenge }
  validates :challenge, presence: true, uniqueness: { scope: :user }
end
