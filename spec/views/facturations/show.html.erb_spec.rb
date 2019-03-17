require 'rails_helper'

RSpec.describe "facturations/show", type: :view do
  before(:each) do
    @facturation = assign(:facturation, Facturation.create!(
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
  end
end
