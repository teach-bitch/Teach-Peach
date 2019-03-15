require 'rails_helper'

RSpec.describe "typeforms/index", type: :view do
  before(:each) do
    assign(:typeforms, [
      Typeform.create!(
        :title => "Title",
        :description => "MyText",
        :id_typeform => "Id Typeform"
      ),
      Typeform.create!(
        :title => "Title",
        :description => "MyText",
        :id_typeform => "Id Typeform"
      )
    ])
  end

  it "renders a list of typeforms" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Id Typeform".to_s, :count => 2
  end
end
