require 'spec_helper'


feature 'Viewing Peeps' do
  before(:each) do
    user = User.create(name: 'name', username: 'username', email: 'test@test.com',
    password: 'test',
    password_confirmation: 'test')

    user.peeps.create(message: 'hello', name: 'Test', username: 'Test')
  end

  scenario 'displays a list of existing links' do
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('hello')
    end
  end
end
