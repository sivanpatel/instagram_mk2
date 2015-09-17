require 'rails_helper'

feature 'photos' do

  context 'no photos have been added yet' do
    scenario 'should display a prompt to show a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'creating posts' do
    scenario 'prompts a user to fill out a form, then displays the new post' do
      visit '/'
      click_link('Sign up')
      fill_in('Email', with: 'test@test.com')
      fill_in('Password', with:'testtest')
      fill_in('Password confirmation', with:'testtest')
      click_button('Sign up')
      click_link 'Add a photo'
      page.attach_file 'photo[image]', 'spec/assets/images/jacket.jpg'
      fill_in 'Name', with: 'cool jacket'
      click_button 'Post'
      expect(page).to have_content 'cool jacket'
      expect(page).to have_selector 'img'
    end
  end

  # context 'viewing photos' do
  #   let!(:jacket) {Photo.create(name:'Jacket')}
  #   scenario 'lets a user view a photo' do
  #     visit '/photos'
  #     click_link 'Add a photo'
  #     page.attach_file 'photo[image]', 'spec/assets/images/jacket.jpg'
  #     fill_in 'Name', with: 'jacket'
  #     click_button 'Post'
  #     click_link 'jacket'
  #     expect(page).to have_content 'jacket'
  #     expect(current_path).to eq "/photos/#{jacket.id}"
  #   end
  # end

  context 'deleting photos' do
    scenario 'removes a photo when a user clicks a delete link' do
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
      click_link 'Delete Jacket'
      expect(page).not_to have_content 'Jacket'
      expect(page).to have_content 'Photo deleted successfully'
    end
  end

end
