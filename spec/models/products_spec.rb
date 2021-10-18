require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'ensure a product with all 4 fields set will indeed save successfully' do
      it "validates" do
       @category = Category.new(
         name: 'name'
       )
        @product = Product.new(
          name: 'name',
          price_cents: 3000,
          quantity: 3,
          category: @category
        )
        expect(@product).to be_valid
      end
    end
    context 'expects a product with a field missing to fail' do
      it "does not validate without name" do
        @category = Category.new(
         name: 'name'
       )
        @product = Product.new(
          name: nil,
          price_cents: 3000,
          quantity: 3,
          category: @category
        )
        expect(@product).to_not be_valid
        assert_equal(["Name can't be blank"], @product.errors.full_messages)
      end
      it "does not validate without price" do
        @category = Category.new(
         name: 'name'
       )
        @product = Product.new(
          name: 'name',
          price_cents: nil,
          quantity: 3,
          category: @category
        )
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it "does not validate without quantity" do
        @category = Category.new(
         name: 'name'
       )
        @product = Product.new(
          name: 'name',
          price_cents: 3000,
          quantity: nil,
          category: @category
        )
        expect(@product).to_not be_valid
        assert_equal(["Quantity can't be blank"], @product.errors.full_messages)
      end
      it "does not validate without category" do
        @category = nil
        @product = Product.new(
          name: 'name',
          price_cents: 3000,
          quantity: 3,
          category: @category
        )
        expect(@product).to_not be_valid
        assert_equal(["Category can't be blank"], @product.errors.full_messages)
        
      end
    end
  end
end
