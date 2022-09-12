require 'rails_helper'

RSpec.describe "project_updates/new", type: :view do
  before(:each) do
    assign(:project_update, ProjectUpdate.new(
      title: "MyString",
      description: "MyString",
      project: nil
    ))
  end

  it "renders new project_update form" do
    render

    assert_select "form[action=?][method=?]", project_updates_path, "post" do

      assert_select "input[name=?]", "project_update[title]"

      assert_select "input[name=?]", "project_update[description]"

      assert_select "input[name=?]", "project_update[project_id]"
    end
  end
end
