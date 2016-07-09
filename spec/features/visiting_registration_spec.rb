require 'rails_helper'

feature 'Visiting the Registration Page' do

  it 'displays a link to login' do
    visit register_path
    find_link 'Log In'
  end

  it 'shows a registration form' do
    visit register_path
    find_field 'user_first_name'
    find_field 'user_last_name'
    find_field 'Email'
    find_field 'Password'
    find_button 'Register'
  end

  it 'submitting that form logs a user in' do
    visit register_path
    fill_in 'user_first_name', with: 'John'
    fill_in 'user_last_name' , with: 'Doe'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Register'
    expect(current_path).to eq(root_path)
  end
end
