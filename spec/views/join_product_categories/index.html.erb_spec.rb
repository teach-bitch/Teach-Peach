require 'rails_helper'

RSpec.describe "join_product_categories/index", type: :view do
  before(:each) do
    assign(:join_product_categories, [
      JoinProductCategory.create!(),
      JoinProductCategory.create!()
    ])
  end

  it "renders a list of join_product_categories" do
    render
  end
end
