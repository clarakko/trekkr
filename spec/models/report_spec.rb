require "rails_helper"

RSpec.describe Report, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:trek) }

  it { should validate_presence_of(:starts_at) }
  it { should validate_presence_of(:report) }

  it { should have_valid(:distance).when("25", "1.2") }
  it { should_not have_valid(:distance).when("Yo!") }
end
