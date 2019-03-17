require 'rails_helper'

RSpec.describe "join_product_categories/new", type: :view do
  before(:each) do
    assign(:join_product_category, JoinProductCategory.new())
  end

  it "renders new join_product_category form" do
    render

    assert_select "form[action=?][method=?]", join_product_categories_path, "post" do
    end
  end
end
