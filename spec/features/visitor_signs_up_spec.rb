require 'spec_helper'
require 'rails_helper'

feature 'Visitor signs up', type: :feature do
  before(:each) do
    FactoryBot.create(:article)
  end

  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com','password', 'first_name', 'last_name', '2000-09-01 00:00:00', 'username'

    expect(page).to have_content("Découvre la sexualité avec Teach Peach")
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password', 'first_name', 'last_name', '2000-09-01 00:00:00', 'username'

    expect(page).to have_content("S'enregistrer")
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', '', 'first_name', 'last_name', '2000-09-01 00:00:00', 'username'

    expect(page).to have_content("S'enregistrer")
  end

  def sign_up_with(email, password, first_name, last_name, birthdate, username)
    visit new_user_registration_path
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[birthdate]', with: birthdate
    fill_in 'user[username]', with: username
    fill_in 'user[password_confirmation]', with: password

    click_button "C'est parti !" 
  end

end