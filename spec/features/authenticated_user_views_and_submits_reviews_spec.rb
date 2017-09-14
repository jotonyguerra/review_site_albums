require 'rails_helper'

feature 'authenticaed user submits a review for an album' do
  let!(:album) {FactoryGirl.create(:album)}
  let!(:user) { FactoryGirl.create(:user) }
  let!(:review) {FactoryGirl.create(:review, user: user, album: album)}
  context 'as a non-user' do
    scenario 'visit and view existing reviews for an album' do
      visit root_path
      click_link "Abbey Road"
      expect(page).to have_content('da bestest thing on urf')
    end
    scenario 'attemp to fill in review form for album' do
        visit root_path
        click_link 'Abbey Road'
        expect(page).to have_content('Sign in to leave a review')
    end
  end
  context 'signed in user' do
    let!(:user) { FactoryGirl.create(:user) }
    before { login_as(user, scope: :user) }
    let!(:review) {FactoryGirl.create(:review, user: user, album: album)}


    scenario 'fill in review form on review site' do
      visit root_path
      click_link 'Abbey Road'
      fill_in 'Review', with: 'pretty good album'
      select('5', from: 'Rating')
      click_button 'Create Review'
      expect(page).to have_content('pretty good album')
    end

    scenario 'edit already submitted review' do
      visit root_path
      click_link 'Abbey Road'
      save_and_open_page
      click_link 'edit'
      fill_in 'Review', with: 'its ok'
      select('5', from: 'Rating')
      click_button 'Update Review'
      expect(page).to have_content('its ok')
    end

    scenario 'delete a submitted review' do
      visit root_path
      click_link 'Abbey Road'
      click_link 'delete'
      expect(page).to_not have_content('5 da bestest thing on urf')
    end

  end
end
