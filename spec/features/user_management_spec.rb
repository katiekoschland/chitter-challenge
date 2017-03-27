require 'web_helper'
require './app/models/user'

feature 'User sign up' do
  scenario 'User can sign up and user record is created' do
    expect(User.all).to eq([])
    sign_up
    expect(User.first.email).to eq("test@example.com")
  end

  scenario 'I can sign up as a new user' do
    sign_up
    expect(page).to have_content('Welcome, test@example.com')
  end

end
