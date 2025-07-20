require 'rails_helper'

RSpec.describe 'watches/edit', type: :view do
  let(:watch) do
    Watch.create!(
      name: 'MyString'
    )
  end

  before do
    assign(:watch, watch)
  end

  it 'renders the edit watch form' do
    render

    assert_select 'form[action=?][method=?]', watch_path(watch), 'post' do
      assert_select 'input[name=?]', 'watch[name]'
    end
  end
end
