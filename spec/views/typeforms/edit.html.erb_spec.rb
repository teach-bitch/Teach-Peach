require 'rails_helper'

RSpec.describe "typeforms/edit", type: :view do
  before(:each) do
    @typeform = assign(:typeform, Typeform.create!(
      :title => "MyString",
      :description => "MyText",
      :id_typeform => "MyString"
    ))
  end

  it "renders the edit typeform form" do
    render

    assert_select "form[action=?][method=?]", typeform_path(@typeform), "post" do

      assert_select "input[name=?]", "typeform[title]"

      assert_select "textarea[name=?]", "typeform[description]"

      assert_select "input[name=?]", "typeform[id_typeform]"
    end
  end
end
