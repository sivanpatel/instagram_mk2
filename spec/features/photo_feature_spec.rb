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
      visit '/photos'
      click_link 'Add a photo'
      page.attach_file 'photo[image]', 'spec/assets/images/jacket.jpg'
      fill_in 'Name', with: 'cool jacket'
      click_button 'Create Photo'
      expect(page).to have_content 'cool jacket'
      expect(page).to have_selector 'img'
    end
  end

  context 'viewing photos' do
    let!(:jacket) {Photo.create(name:'Jacket')}
    scenario 'lets a user view a photo' do
      visit '/photos'
      click_link 'Jacket'
      expect(page).to have_content 'Jacket'
      expect(current_path).to eq "/photos/#{jacket.id}"
    end
  end

end
