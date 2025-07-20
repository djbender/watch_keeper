require 'rails_helper'

RSpec.describe 'watches/show', type: :view do
  before do
    assign(:watch, Watch.create!(
                     name: 'Name'
                   ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
