require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should have_valid(:username).when('snusmumriken') }
  it { should_not have_valid(:username).when('', nil,) }

  it { should have_valid(:email).when('snusmumriken@mumintroll.com') }
  it { should_not have_valid(:email).when('', nil, 'snus', 'snus.com') }

  it 'has matching password and password confirmation' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'moredifferentpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
