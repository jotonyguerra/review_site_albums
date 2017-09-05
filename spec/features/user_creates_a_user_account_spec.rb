require 'rails_helper'



feature "user can create an account" do
  context "as an unauthenticated user" do

    scenario "user visits sign up page" do
      visit root_path
      click_link "sign up"
      expect(page).to have_content('Email')
      expect(page).to_not have_content('sign out')
    end

    scenario "user fills in valid information and successfully creates account" do
      visit new_user_registration_path

      fill_in 'Email', with: 'testuser@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'

      expect(page).to_not have_content('sign up')
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end
end
