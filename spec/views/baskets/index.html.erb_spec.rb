require 'rails_helper'

RSpec.describe "baskets/index", type: :view do
  before(:each) do
    assign(:baskets, [
      Basket.create!(),
      Basket.create!()
    ])
  end

  it "renders a list of baskets" do
    render
  end
end
