require 'rails_helper'

RSpec.describe JoinProductCategory, type: :model do

  before(:each) do
    @join_product_category = FactoryBot.create(:join_product_category)
  end

  it "has a valid factory" do
    expect(build(:join_product_category)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@join_product_category).to be_a(JoinProductCategory)
    end

  end

  context "associations" do
    describe "users" do
      it { expect(@join_product_category).to belong_to(:product) }
      it { expect(@join_product_category).to belong_to(:product_category) }
    end
  end

end
