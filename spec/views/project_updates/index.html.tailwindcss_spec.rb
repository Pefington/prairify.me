require 'rails_helper'

RSpec.describe "project_updates/index", type: :view do
  before(:each) do
    assign(:project_updates, [
      ProjectUpdate.create!(
        title: "Title",
        description: "Description",
        project: nil
      ),
      ProjectUpdate.create!(
        title: "Title",
        description: "Description",
        project: nil
      )
    ])
  end

  it "renders a list of project_updates" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
