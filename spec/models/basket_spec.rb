require 'rails_helper'

RSpec.describe Basket, type: :model do

  before(:each) do
    @basket = FactoryBot.create(:basket)
  end

  it "has a valid factory" do
    expect(build(:basket)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@basket).to be_a(Basket)
    end

  end

  context "associations" do
    describe "baskets" do
      it { expect(@basket).to have_many(:line_items) }
      it { expect(@basket).to have_one(:facturation) }
    end
  end

end
