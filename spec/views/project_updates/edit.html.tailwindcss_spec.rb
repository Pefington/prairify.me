require 'rails_helper'

RSpec.describe "project_updates/edit", type: :view do
  before(:each) do
    @project_update = assign(:project_update, ProjectUpdate.create!(
      title: "MyString",
      description: "MyString",
      project: nil
    ))
  end

  it "renders the edit project_update form" do
    render

    assert_select "form[action=?][method=?]", project_update_path(@project_update), "post" do

      assert_select "input[name=?]", "project_update[title]"

      assert_select "input[name=?]", "project_update[description]"

      assert_select "input[name=?]", "project_update[project_id]"
    end
  end
end
