require 'rails_helper'

RSpec.describe "typeforms/show", type: :view do
  before(:each) do
    @typeform = assign(:typeform, Typeform.create!(
      :title => "Title",
      :description => "MyText",
      :id_typeform => "Id Typeform"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Id Typeform/)
  end
end
