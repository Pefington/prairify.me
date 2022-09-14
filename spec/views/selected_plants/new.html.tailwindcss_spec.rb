require 'rails_helper'

RSpec.describe "selected_plants/new", type: :view do
  before(:each) do
    assign(:selected_plant, SelectedPlant.new(
      user: nil,
      inaturalist_id: 1
    ))
  end

  it "renders new selected_plant form" do
    render

    assert_select "form[action=?][method=?]", selected_plants_path, "post" do

      assert_select "input[name=?]", "selected_plant[user_id]"

      assert_select "input[name=?]", "selected_plant[inaturalist_id]"
    end
  end
end
