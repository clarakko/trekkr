require 'rails_helper'

RSpec.describe Challenge, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:tagline) }
  it { should validate_presence_of(:description) }
end
