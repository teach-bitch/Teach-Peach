require 'rails_helper'

RSpec.describe "baskets/show", type: :view do
  before(:each) do
    @basket = assign(:basket, Basket.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
