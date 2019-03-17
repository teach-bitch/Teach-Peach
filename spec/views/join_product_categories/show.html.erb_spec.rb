require 'rails_helper'

RSpec.describe "join_product_categories/show", type: :view do
  before(:each) do
    @join_product_category = assign(:join_product_category, JoinProductCategory.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
