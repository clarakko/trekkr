require 'rails_helper'

RSpec.describe Trek, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:description) }
end
