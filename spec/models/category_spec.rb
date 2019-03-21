require 'rails_helper'

RSpec.describe Category, type: :model do

  before(:each) do
    @category = FactoryBot.create(:category)
  end

  it "has a valid factory" do
    expect(build(:category)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@category).to be_a(Category)
    end

    it "validates presence of title" do
      should validate_presence_of(:title).
      with_message("Tu as oublié le nom de la catégorie !")
    end

  end

  context "associations" do
    describe "categories" do
      it { expect(@category).to have_many(:article_categories) }
      it { expect(@category).to have_many(:articles) }
    end
  end

  context "class" do
    it "should return a string" do
      expect(@category.title).to be_a(String)
    end
  end

end
