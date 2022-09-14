require 'rails_helper'

RSpec.describe 'selected_plants/edit', type: :view do
  before do
    @selected_plant = assign(:selected_plant, SelectedPlant.create!(
                                                user: nil,
                                                inaturalist_id: 1
                                              ))
  end

  it 'renders the edit selected_plant form' do
    render

    assert_select 'form[action=?][method=?]', selected_plant_path(@selected_plant), 'post' do
      assert_select 'input[name=?]', 'selected_plant[user_id]'

      assert_select 'input[name=?]', 'selected_plant[inaturalist_id]'
    end
  end
end
