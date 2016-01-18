require 'rails_helper'

describe Entry do
  it { should belong_to(:user) }
  it { should belong_to(:challenge) }

  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }

  it { should have_valid(:challenge).when(Challenge.new) }
  it { should_not have_valid(:challenge).when(nil) }
end
