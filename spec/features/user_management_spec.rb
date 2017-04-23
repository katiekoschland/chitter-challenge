require 'web_helper'
require './app/models/user'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test@example.com')
    expect(User.first.email).to eq('test@example.com')
  end


    scenario 'requires a matching confirmation password' do
      expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    end

  end
