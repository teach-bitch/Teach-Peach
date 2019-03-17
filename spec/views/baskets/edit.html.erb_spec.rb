require 'rails_helper'

RSpec.describe "baskets/edit", type: :view do
  before(:each) do
    @basket = assign(:basket, Basket.create!())
  end

  it "renders the edit basket form" do
    render

    assert_select "form[action=?][method=?]", basket_path(@basket), "post" do
    end
  end
end
