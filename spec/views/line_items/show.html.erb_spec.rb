require 'rails_helper'

RSpec.describe "line_items/show", type: :view do
  before(:each) do
    @line_item = assign(:line_item, LineItem.create!(
      :quantity => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
