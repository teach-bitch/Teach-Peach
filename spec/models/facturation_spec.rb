require 'rails_helper'

RSpec.describe Facturation, type: :model do

  before(:each) do
    @facturation = FactoryBot.create(:facturation)
  end

  it "has a valid factory" do
    expect(build(:facturation)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@facturation).to be_a(Facturation)
    end

  context "associations" do
    describe "facturation" do
      it { expect(@facturation).to belong_to(:basket) }
      it { expect(@facturation).to belong_to(:user) }
    end
  end

end
end