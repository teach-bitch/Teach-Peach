require 'rails_helper'

RSpec.describe "facturations/index", type: :view do
  before(:each) do
    assign(:facturations, [
      Facturation.create!(
        :price => "9.99"
      ),
      Facturation.create!(
        :price => "9.99"
      )
    ])
  end

  it "renders a list of facturations" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
