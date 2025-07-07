require 'rails_helper'

RSpec.describe "watches/index", type: :view do
  before(:each) do
    assign(:watches, [
      Watch.create!(
        name: "Name"
      ),
      Watch.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of watches" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
