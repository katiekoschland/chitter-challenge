def sign_up(name: 'test', username: 'test', email: 'test@example.com',
            password: '12345678',
            password_confirmation: '12345678')
  visit '/users/new'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
