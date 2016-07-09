require 'rails_helper'

feature 'Visiting the Login Page' do
  it 'shows a login form' do
    visit login_path
    find_field 'email'
    find_field 'Password'
    find_button 'Login'
  end

  it 'and submitting that form logs a user in' do
    user = User.create(first_name: 'John', last_name:'Doe', email: 'john@example.com', password: 'password')
    visit login_path
    fill_in 'email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    expect(current_path).to eq(root_path)
  end
end