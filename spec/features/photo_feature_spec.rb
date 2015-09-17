require 'rails_helper'

feature 'photos' do

  context 'no photos have been added yet' do
    scenario 'should display a prompt to show a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

end
