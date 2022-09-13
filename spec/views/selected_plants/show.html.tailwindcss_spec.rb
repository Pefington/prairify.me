require 'rails_helper'

RSpec.describe "selected_plants/show", type: :view do
  before(:each) do
    @selected_plant = assign(:selected_plant, SelectedPlant.create!(
      user: nil,
      inaturalist_id: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
