require 'rails_helper'

feature 'commenting' do

  before { Photo.create name: 'test' }

  scenario 'allows users to leave a comment using a form' do
    visit '/'
    click_link('Sign up')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with:'testtest')
    fill_in('Password confirmation', with:'testtest')
    click_button('Sign up')
    click_link 'Add a photo'
    page.attach_file 'photo[image]', 'spec/assets/images/jacket.jpg'
    fill_in 'Name', with: 'Jacket'
    click_button 'Post'
    click_link 'Comment'
    fill_in 'Thoughts', with: 'cool'
    click_button 'Leave Comment'
    expect(current_path).to eq '/photos'
    expect(page).to have_content 'cool'
  end


end
