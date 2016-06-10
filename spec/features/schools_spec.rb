require 'rails_helper'

feature 'Schools Index', js: true do
  context 'without schools' do
    before(:each) do
      visit root_path
    end
    
    scenario 'displays no schools message' do
      expect(find('#no-schools').text).to eq('There are no schools. Everyone is stupid. :(')
    end

    scenario 'adding a new school' do
      find('.new-school-btn').click
      fill_in('school[name]', with: 'New School')
      find('.select-dropdown').click
      find('.new-school-btn').click
      expect(find('#school-name')).to_not be_nil
    end
  end

  # context 'with schools' do

  # end
end 