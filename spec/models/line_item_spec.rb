require 'rails_helper'

RSpec.describe LineItem, type: :model do

  before(:each) do
    @line_item = FactoryBot.create(:line_item)
  end

  it "has a valid factory" do
    expect(build(:line_item)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@line_item).to be_a(LineItem)
    end

  end

  context "associations" do
    describe "line_items" do
      it { expect(@line_item).to belong_to(:basket) }
      it { expect(@line_item).to belong_to(:product) }
    end
  end

  context "class" do
    it "should return a string" do
      expect(@line_item.quantity).to be_a(Integer)
    end
  end

end
