require 'rails_helper'

RSpec.describe "product_categories/index", type: :view do
  before(:each) do
    assign(:product_categories, [
      ProductCategory.create!(
        :title => "Title"
      ),
      ProductCategory.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of product_categories" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
