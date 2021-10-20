require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create(
          name: 'name',
          email: 'test@test.com',
          password: 'password',
          password_confirmation: 'password'
        )
  end

  scenario "User Authentication word" do
   
    visit '/login'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'

    click_on 'Submit'

    page.has_content?('Signed in as name')

  end

end