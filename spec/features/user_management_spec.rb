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

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "I cannot sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "I cannot sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end


feature 'User sign in' do

  let!(:user) do
    User.create(name: 'name', username: 'username', email: 'user@example.com',
    password: 'password',
    password_confirmation: 'password')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_stupid_password')).to be_nil
  end

  feature 'User signs out' do

    before(:each) do
      User.create(name: 'test', username: 'test', email: 'test@test.com',
      password: 'test',
      password_confirmation: 'test')
    end

    scenario 'while being signed in' do
      sign_in(email: 'test@test.com', password: 'test')
      click_button 'Sign out'
      expect(page).to have_content('goodbye!')
      expect(page).not_to have_content('Welcome, test@test.com')
    end

  end
end
