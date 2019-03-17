require 'rails_helper'

RSpec.describe "product_categories/show", type: :view do
  before(:each) do
    @product_category = assign(:product_category, ProductCategory.create!(
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
