require 'rails_helper'

RSpec.describe Article, type: :model do

<<<<<<< HEAD
  before(:each) do
    @article = FactoryBot.create(:article)
  end

  it "has a valid factory" do
    expect(build(:article)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@article).to be_a(Article)
    end

    describe "#title" do
      it do
        should validate_presence_of(:title).
        with_message("Tu as oublié le titre de ton article !")
      end
      it "title length" do
        expect(@article.title.length).to be >3 && be <30
      end
    end

    describe "#content" do
      it do
        should validate_presence_of(:content).
        with_message("Tu as oublié le contenu de ton article !")
      end
      it "description length" do
        expect(@article.content.length).to be >20 && be <1000
      end
    end

  end
=======
 before(:each) do
 @article = FactoryBot.create(:article)
end

it "has a valid factory" do
 # teste toujours tes factories pour voir si elles sont valides
 expect(build(:article)).to be_valid
end

context "validation" do

 it "is valid with valid attributes" do
   expect(@article).to be_a(Article)
 end

 describe "#title" do
   it do
     should validate_presence_of(:title).
     with_message("Tu as oublié le titre de ton article !")
   end

   it "title length" do
     expect(@article.title.length).to be >3 && be <30
   end
 end

 describe "#content" do
   it do
     should validate_presence_of(:content).
    with_message("Tu as oublié le contenu de ton article !")
   end

   it "description length" do
     expect(@article.content.length).to be >20 && be <1000
   end
 end
>>>>>>> c8834d47b05911faa32ee42be44f86fdbbd24004

  context "public instance methods" do

    describe "#title" do
      it "should return a string" do
        expect(@article.title).to be_a(String)
      end
    end

    describe "#content" do
      it "should return a string" do
        expect(@article.content).to be_a(String)
      end
    end

<<<<<<< HEAD
  end
  
=======
context "public instance methods" do

describe "#title" do

  it "should return a string" do
    expect(@article.title).to be_a(String)
  end

end

describe "#content" do

  it "should return a string" do
    expect(@article.content).to be_a(String)
  end

end

>>>>>>> c8834d47b05911faa32ee42be44f86fdbbd24004
end
