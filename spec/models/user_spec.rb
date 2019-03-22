require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    it "validates presence of first name" do
      should validate_presence_of(:first_name).
      with_message("Tu as oublié de spécifier un prénom !")
    end

    it "validates presence of last name" do
      should validate_presence_of(:last_name).
      with_message("Tu as oublié de spécifier un nom !")
    end

    it "validates presence of username" do
      should validate_presence_of(:username).
      with_message("Tu as oublié de spécifier un nom d'utilisateur !")
    end

    it "validates presence of email" do
      should validate_presence_of(:email).
      with_message("Tu as oublié de spécifier une adresse email !")
    end

    it "validates presence of birthdate" do
      should validate_presence_of(:birthdate).
      with_message("Tu as oublié de spécifier une date de naissance !")
    end

    it "validates presence of password" do
      should validate_presence_of(:password).
      with_message("Tu as oublié de spécifier un mot de passe !")
    end

  end

  context "associations" do
    describe "users" do
      it { expect(@user).to have_many(:articles) }
      it { expect(@user).to have_many(:facturations) }
      it { expect(@user).to have_one(:basket) }
    end
  end

  context "class" do
    it "should return a string" do
      expect(@user.first_name).to be_a(String)
    end
    it "should return a string" do
      expect(@user.last_name).to be_a(String)
    end
    it "should return a string" do
      expect(@user.username).to be_a(String)
    end
    it "should return a string" do
      expect(@user.email).to be_a(String)
    end
    it "should return a string" do
      expect(@user.password).to be_a(String)
    end
    it "should return a date" do
      expect(@user.birthdate).to be_a(ActiveSupport::TimeWithZone)
    end
  end

end
