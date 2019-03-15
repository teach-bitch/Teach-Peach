require 'rails_helper'

RSpec.describe "typeforms/new", type: :view do
  before(:each) do
    assign(:typeform, Typeform.new(
      :title => "MyString",
      :description => "MyText",
      :id_typeform => "MyString"
    ))
  end

  it "renders new typeform form" do
    render

    assert_select "form[action=?][method=?]", typeforms_path, "post" do

      assert_select "input[name=?]", "typeform[title]"

      assert_select "textarea[name=?]", "typeform[description]"

      assert_select "input[name=?]", "typeform[id_typeform]"
    end
  end
end
