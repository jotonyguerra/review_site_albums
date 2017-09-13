require 'rails_helper'

feature 'authenticaed user submits a review for an album' do
  let!(:album) {FactoryGirl.create(:album)}

  context 'as a non-user' do
    scenario 'attemp to fill in review form for album' do
        visit root_path

        click_link 'Abbey Road'
        expect(page).to have_content('Sign in to leave a review')
    end
  end
  context 'signed in user' do
    let!(:user) { FactoryGirl.create(:user) }
    before { login_as(user, scope: :user) }

    scenario 'fill in review form on review site' do
      visit root_path
      click_link 'Abbey Road'
      fill_in 'Review', with: 'pretty good album'
      select('5', from: 'Rating')
      click_button 'Create Review'
      expect(page).to have_content('pretty good album')
    end

  end
end
