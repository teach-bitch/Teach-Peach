require 'rails_helper'

RSpec.describe ArticleCategory, type: :model do

  before(:each) do
    @article_category = FactoryBot.create(:article_category)
  end

  it "has a valid factory" do
    expect(build(:article_category)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@article_category).to be_a(ArticleCategory)
    end

  end

  context "associations" do
    describe "article_categories" do
      it { expect(@article_category).to belong_to(:article) }
      it { expect(@article_category).to belong_to(:category) }
    end
  end

end
