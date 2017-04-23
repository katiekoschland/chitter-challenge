feature 'Creating peeps' do
  before(:each) do
    sign_up
end

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'message',   with: 'My first peep!'
    click_button 'Create peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('My first peep!')
    end
  end
end
