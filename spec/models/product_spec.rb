require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
  @product = FactoryBot.create(:product)
end

it "has a valid factory" do
  # teste toujours tes factories pour voir si elles sont valides
  expect(build(:product)).to be_valid
end

context "validation" do

  it "is valid with valid attributes" do
    expect(@product).to be_a(Product)
  end

  describe "#name" do
    it do
      should validate_presence_of(:name).
      with_message("Tu as oublié le titre de ton produit !")
    end

    it "title length" do
      expect(@product.name.length).to be >2 && be <20
    end
  end

  describe "#description" do
    it do
      should validate_presence_of(:description).
	with_message("Tu as oublié de spécifier une description !")
    end

    it "description length" do
      expect(@product.description.length).to be >20 && be <150
    end
  end

  describe "#price" do
    it do
      should validate_presence_of(:description).
	with_message("Tu as oublié de spécifier une description !")
    end

    it "description length" do
      expect(@product.price).to be >0
    end
  end

end


context "public instance methods" do
  
 describe "#name" do

   it "should return a string" do
     expect(@product.name).to be_a(String)
   end

 end

 describe "#brand" do

   it "should return a string" do
     expect(@product.brand).to be_a(String)
   end

 end

 describe "#quantity" do

   it "should return an Integer" do
     expect(@product.quantity).to be_a(Integer)
   end

 end

 describe "#reference" do

 it "should return a string" do
   expect(@product.reference).to be_a(String)
 end

end

end

end