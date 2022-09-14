require 'rails_helper'

RSpec.describe Project, type: :model do
  before do
    @project = create(:project)
  end

  context 'validation' do
    it 'has a valid factory' do
      expect(build(:project)).to be_valid
    end

    it 'is valid with valid attributes' do
      expect(@project).to be_a(described_class)
    end

    it 'returns a string' do
      expect(@project.name).to be_a(String)
    end

    it 'returns a string' do
      expect(@project.description).to be_a(String)
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
