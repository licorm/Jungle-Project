require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
  end

  scenario "They see product features" do
    # ACT
    visit root_path

    page.find('footer').find_button('Add').click

    page.has_content?('My Cart (1)')

    # DEBUG / VERIFY
    save_screenshot

  end
end
