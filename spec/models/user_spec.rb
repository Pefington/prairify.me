require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  context 'validation' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    it 'is valid with valid attributes' do
      expect(@user).to be_a(described_class)
    end

    describe '#password' do
      it { expect(@user).to validate_length_of(:password).is_at_least(6) }
    end

    it 'returns a string' do
      expect(@user.username).to be_a(String)
    end

    it 'returns a string' do
      expect(@user.password).to be_a(String)
    end

    it 'returns a string' do
      expect(@user.email).to be_a(String)
    end

    context 'associations' do
      describe '#projects' do
        it { expect(@user).to have_many(:projects) }
        it { expect(@user).to have_many(:comments) }
        it { expect(@user).to have_many(:likes) }
        it { expect(@user).to have_many(:favourites) }
      end
    end
  end
end
