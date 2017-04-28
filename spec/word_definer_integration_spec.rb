require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('contact',{:type => :feature}) do
  it('on click of word it displays the definition page') do
    visit('/')
    click_on('Add a word!')
    fill_in('word', :with => "Hulk")
    expect(page).to have_content('Word Definer Existing words Add a new word New word Add a word!')
  end

    it('on click of "add definition" the definition that user inputted will appear') do
      visit('/words/1')
      click_button('Add a definition!')
      fill_in('definition', :with => "Giant green guy who is insanely strong")
      expect(page).to have_content('Add a Definition for New definition Add a definition! Home')
    end
    it('click on home will take you back to index') do
      visit('/words/1')
      click_on('Home')
      visit('/')
    end
end
