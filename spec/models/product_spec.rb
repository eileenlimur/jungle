require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before do
      @product = Product.new
      @category = Category.new(:name => "Things")
    end
    
    context "when all required params are given" do
      it "should have no errors" do
        @product.name = "Silly Putty"
        @product.quantity = 20
        @product.price = 30
        @product.category = @category
        @product.save!
        expect(@product).to be_valid
      end
    end

    context "when no name is given" do
      it "should include a name error in the error message array" do
        @product.quantity = 20
        @product.price = 30
        @product.category = @category
        @product.save
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context "when no category is given" do
      it "should include a category error in the error message array" do
        @product.name = "Silly Putty"
        @product.quantity = 20
        @product.price = 30
        @product.save
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end

    context "when no quantity is given" do
      it "should include a quantity error in the error message array" do
        @product.name = "Silly Putty"
        @product.price = 30
        @product.category = @category
        @product.save
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context "when no price is given" do
      it "should include a price error in the error message array" do
        @product.name = "Silly Putty"
        @product.quantity = 20
        @product.category = @category
        @product.save
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end
    
  end
end
