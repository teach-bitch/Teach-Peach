require 'rails_helper'

RSpec.describe Typeform, type: :model do

  before(:each) do
    @typeform = FactoryBot.create(:typeform)
  end

  it "has a valid factory" do
    expect(build(:typeform)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@typeform).to be_a(Typeform)
    end

    it "validates presence of for_adult" do
      should validate_presence_of(:for_adult)
    end

    it "validates presence of title" do
      should validate_presence_of(:title).
      with_message("Tu as oublié le titre du formulaire !")
    end

    it "validates presence of description" do
      should validate_presence_of(:description).
      with_message("Tu as oublié la description du formulaire !")
    end

    it "validates presence of id_typeform" do
      should validate_presence_of(:id_typeform).
      with_message("Tu as oublié de mettre le lien vers le formulaire !")
    end

    it "validates presence of id_results" do
      should validate_presence_of(:id_results).
      with_message("Tu as oublié de mettre le lien vers les résultats du formulaire !")
    end
  end

  context "associations" do
    describe "typeforms" do
      it { expect(@typeform).to belong_to(:user) }
    end
  end

end
