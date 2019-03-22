require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  before(:each) do
    @product_category = FactoryBot.create(:product_category)
  end

  it "has a valid factory" do
    expect(build(:product_category)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@product_category).to be_a(ProductCategory)
    end

    it "validates presence of title" do
      should validate_presence_of(:title)
    end
  end

  context "class" do
    it "should return a string" do
      expect(@product_category.title).to be_a(String)
    end
  end

end
