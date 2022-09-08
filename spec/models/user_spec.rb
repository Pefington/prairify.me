require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = User.create(username: "Franck", email: "franckzappa@yomail.com", password: "zappafranck")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end
  end
  context "associations" do

    describe "projects" do
      it "should have_many projects" do
        project = Project.create(user: @user)
        expect(@user.projects.include?(project)).to eq(true)
      end
    end

  end
end
