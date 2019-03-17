require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :name => "MyString",
      :description => "MyText",
      :brand => "MyString",
      :price => "9.99",
      :quantity => 1,
      :reference => "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[brand]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[quantity]"

      assert_select "input[name=?]", "product[reference]"
    end
  end
end
