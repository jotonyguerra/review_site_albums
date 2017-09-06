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

    scenario "user fails to fill the required fields and does not create an account" do
      visit new_user_registration_path
      fill_in 'Email', with: 'blah'
      fill_in 'Password', with: ''
      click_button 'Sign up'
      expect(page).to have_content("Email is invalid")
      expect(page).to have_content("Password can't be blank")
    end
  end
  context "As an Authenticated User" do
    let!(:user) { FactoryGirl.create(:user) }
    before { login_as(user, scope: :user) }
    scenario "User Signs Out" do
      visit root_path
      save_and_open_page
      click_link 'sign out'
      expect(page).to have_content("Bye Felicia")
      expect(page).to have_content("sign in")
    end
  end


end
