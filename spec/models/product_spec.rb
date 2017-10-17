require 'rails_helper'

RSpec.describe Product, type: :model do

  it('should create a new product') do
    @category = Category.new(name: 'cats')
    @category.save
    product = Product.new(name: 'fat', price: 1.00, quantity: 1, category: @category)
    expect(product).to be_valid
  end

   it('should be invalid without a name') do
    @category = Category.new(name: 'cats')
    @category.save
    product = Product.new(name: nil, price: 1.00, quantity: 1, category: @category)
    expect(product).to_not be_valid
    expect(product.errors.messages[:name]).to include('can\'t be blank')
  end

  it('should be invalid without a price') do
    @category = Category.new(name: 'cats')
    @category.save
    product = Product.new(name: 'fat', price: nil, quantity: 1, category: @category)
    expect(product).to_not be_valid
    expect(product.errors.messages[:price]).to include('can\'t be blank')
  end

it('should be invalid without quantity') do
    @category = Category.new(name: 'cats')
    @category.save
    product = Product.new(name: 'fat', price: 1.00, quantity: nil, category: @category)
    expect(product).to_not be_valid
    expect(product.errors.messages[:quantity]).to include('can\'t be blank')
  end

it('should be invalid without a category') do
    @category = Category.new(name: 'cats')
    @category.save
    product = Product.new(name: 'fat', price: 1.00, quantity: 1, category: nil)
    expect(product).to_not be_valid
    expect(product.errors.messages[:category]).to include('can\'t be blank')
  end

end