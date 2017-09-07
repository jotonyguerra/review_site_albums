require 'rails_helper'

feature 'user adds an album' do
  let!(:album) {FactoryGirl.create(:album)}
  context "As an unauthenticated user" do
    scenario "views the a list of albums on the index page" do
      visit root_path
      expect(page).to have_content("Abbey Road")
    end    

  end

  context " authenticated user visit new album page" do
    let!(:user) { FactoryGirl.create(:user) }
    before { login_as(user, scope: :user) }

    scenario 'add an album to be reviewed' do
      visit new_album_path
      fill_in('Title', with: 'Damn')
      fill_in('Artist', with: 'Kendrick Lamar')
      fill_in('Release year', with: '2017')
      click_button 'Create Album'
      expect(page).to have_content('Successfully added album')
      expect(page).to have_content('Damn')
    end
    scenario 'fail to add album by leaving a field empty' do
      visit new_album_path
      fill_in('Title', with: 'Damn')
      click_button 'Create Album'
      expect(page).to have_content('Title and Artist must be filled')
    end
  end
end
