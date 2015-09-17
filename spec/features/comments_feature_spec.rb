require 'rails_helper'

feature 'commenting' do

  before { Photo.create name: 'test' }

  scenario 'allows users to leave a comment using a form' do
    visit '/photos'
    click_link 'Comment'
    fill_in 'Thoughts', with: 'cool'
    click_button 'Leave Comment'
    expect(current_path).to eq '/photos'
    expect(page).to have_content 'cool'
  end


end