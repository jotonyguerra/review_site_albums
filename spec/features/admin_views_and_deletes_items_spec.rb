require 'rails_helper'
feature "admin views users" do

  context "Normal User" do
    let(:user) {FactoryGirl.create(:user)}
    before { login_as(user, scope: :user)}

    scenario "User attempts to view user index page" do
      visit admin_users_path
      expect(page).to have_content("Not an admin, user signed out and redirected")
    end
  end

  context "User admin" do
    let(:user) {FactoryGirl.create(:user)}
    before { login_as(user, scope: :user)}
    let(:user2) {FactoryGirl.create(:user)}
    before { login_as(user2, scope: :user)}
    let(:admin) {FactoryGirl.create(:user, role: 'admin')}
    before { login_as(admin, scope: :user) }

    scenario 'Admin views all users on the index page' do
      visit admin_users_path
      expect(page).to have_content('testuser2@gmail.com')
      expect(page).to have_content('delete')
    end
    scenario 'Admin deletes user' do
      visit admin_users_path
      click_link('delete testuser5@gmail.com')
      expect(page).to_not have_content("testuser5@gmail.com")
    end
  end

end
