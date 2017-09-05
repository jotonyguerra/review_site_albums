require 'rails_helper'

feature 'user adds an album' do
  let!(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: :user) }

  context "user visit new album page" do
    scenario 'add an album to be reviewed' do
      visit new_album_path
      fill_in('Title', with: 'Damn')
      fill_in('Artist', with: 'Kendrick Lamar')
      fill_in('Release year', with: '2017')
      click_button 'Create Album'
      expect(page).to have_content('Successfully added album')
      expect(page).to have_content('Damn')
    end
  end
end
