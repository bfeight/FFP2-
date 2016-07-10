require 'rails_helper'

feature 'Editing the visuals' do

  it 'shows a visuals edit form' do
    visit edit_user_visual_path
    find_field 'visual_title'
    find_field 'visual_description'
    find_button 'Update Visual'
  end

  it 'submitting that form udpates a visual' do
    visit update_visual_path
    fill_in 'visual_title', with: 'new things'
    fill_in 'visual_description', with: 'all the new things'

    click_button 'Update Visual'
    expect(current_path).to eq(root_path)
  end
end
