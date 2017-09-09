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
      fill_in('Title', with: 'Section 80')
      fill_in('Artist', with: 'Kendrick Lamar')
      fill_in('Release year', with: '2005')
      click_button 'Create Album'
      expect(page).to have_content('Successfully added album')
      expect(page).to have_content('Section 80')
    end
    scenario 'fail to add album by leaving a field empty' do
      visit new_album_path
      fill_in('Title', with: 'Damn')
      click_button 'Create Album'
      expect(page).to have_content('Title and Artist must be filled')
    end
    scenario 'edit and change the title of an album' do
      test_update = FactoryGirl.create(:album, title: 'Channel', artist: 'Frank Ocean')
      test_update.save
      click_link 'Channel'
      click_link 'edit'
      fill_in('Title', with: 'Chanel')
      click_link 'Create Album'
      expect(page).to have_content('Chanel')
    end
    scenario 'add then delete an album' do
      visit new_album_path
      fill_in('Title', with: 'The Autobiography')
      fill_in('Artist', with: 'Vic Mensa')
      fill_in('Release year', with: '2017')
      click_button 'Create Album'
      expect(page).to have_content('Successfully added album')
      expect(page).to have_content('The Autobiography')
      click_link 'The Autobiography'
      click_link 'delete'
      expect(page).to have_content('Album Deleted')
    end
  end
end
