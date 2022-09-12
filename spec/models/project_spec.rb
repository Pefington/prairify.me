
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
  end
end
