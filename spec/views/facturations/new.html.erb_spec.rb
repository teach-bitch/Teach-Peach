require 'rails_helper'

RSpec.describe "facturations/new", type: :view do
  before(:each) do
    assign(:facturation, Facturation.new(
      :price => "9.99"
    ))
  end

  it "renders new facturation form" do
    render

    assert_select "form[action=?][method=?]", facturations_path, "post" do

      assert_select "input[name=?]", "facturation[price]"
    end
  end
end
