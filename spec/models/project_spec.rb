require 'rails_helper'

RSpec.describe Project, type: :model do
  before do
    @project = FactoryBot.create(:project)
  end

  context 'validation' do
    it 'has a valid factory' do
      expect(build(:project)).to be_valid
    end

    it 'is valid with valid attributes' do
      expect(@project).to be_a(Project)
    end

    context 'associations' do
      describe '#projects' do
        it { expect(@project).to have_many(:comments) }
        it { expect(@project).to have_many(:likes) }
        it { expect(@project).to have_many(:favourites) }
        it { expect(@project).to have_many(:plants) }
      end
    end
  end
end
