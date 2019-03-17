require 'rails_helper'

RSpec.describe "join_product_categories/edit", type: :view do
  before(:each) do
    @join_product_category = assign(:join_product_category, JoinProductCategory.create!())
  end

  it "renders the edit join_product_category form" do
    render

    assert_select "form[action=?][method=?]", join_product_category_path(@join_product_category), "post" do
    end
  end
end
