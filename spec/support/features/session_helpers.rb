module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit new_user_registration
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button "C'est parti !" 
    end

    def sign_in
      user = create(:user)
      visit new_user_registration
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Connexion'
    end
  end
end