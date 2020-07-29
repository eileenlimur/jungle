require 'rails_helper'

RSpec.feature "Visitor adds a product to cart from homepage", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the cart items count increase to 1" do
    visit root_path
    within ("article:first-of-type") { find_link("Details").click }
  end
end
