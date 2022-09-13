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
    end
  end
end
