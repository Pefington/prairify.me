require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.create(:comment)
  end

  context 'validation' do
    it 'has a valid factory' do
      expect(build(:comment)).to be_valid
    end

    describe '#content' do
      it { expect(@comment).to validate_presence_of(:content) }
      it { expect(@comment).to validate_length_of(:content).is_at_least(2) }
      it { expect(@comment).to validate_length_of(:content).is_at_most(150) }
    end
  end
end
