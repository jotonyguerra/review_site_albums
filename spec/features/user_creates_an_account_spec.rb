require 'rails_helper'

feature 'user adds an album', %q(

  As a user
  I want to add board games
  So that I can keep track of my collection

) do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'add an album to be reviewed' do
    login_as(user)
    visit #new path for album

    fill_in 'title' with: 'Damn'
    fill_in 'artist' with: 'Kendrick Lamar'
    fill_in 'release_year' with: '2017'

    expect(page).to have_content()
    expect(page).to have_content('Damn')
  end

end
