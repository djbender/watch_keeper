require 'rails_helper'

RSpec.describe "watches/new", type: :view do
  before(:each) do
    assign(:watch, Watch.new(
      name: "MyString"
    ))
  end

  it "renders new watch form" do
    render

    assert_select "form[action=?][method=?]", watches_path, "post" do

      assert_select "input[name=?]", "watch[name]"
    end
  end
end
