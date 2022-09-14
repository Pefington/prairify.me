require 'rails_helper'

RSpec.describe 'selected_plants/index', type: :view do
  before do
    assign(:selected_plants, [
             SelectedPlant.create!(
               user: nil,
               inaturalist_id: 2
             ),
             SelectedPlant.create!(
               user: nil,
               inaturalist_id: 2
             )
           ])
  end

  it 'renders a list of selected_plants' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end