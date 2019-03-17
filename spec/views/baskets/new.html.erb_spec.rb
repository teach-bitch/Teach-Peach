require 'rails_helper'

RSpec.describe "baskets/new", type: :view do
  before(:each) do
    assign(:basket, Basket.new())
  end

  it "renders new basket form" do
    render

    assert_select "form[action=?][method=?]", baskets_path, "post" do
    end
  end
end
