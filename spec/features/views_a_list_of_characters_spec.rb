require 'rails_helper'

feature "user views a list of characters", %Q{
  As a site visitor
  I want to view a list of people's favorite TV characters
  So I can find wonky characters to watch
} do

# Acceptance Criteria:
# * I can see a list of all the characters
# * The character's name and the TV show it is associated with are listed

  scenario 'user views a list of characters' do
    characters = []
    characters_attrs = [
      {name: 'John Doe', actor: 'Snow', description: 'Game of thrones character'},
      {name: 'Ned Stark', actor: 'Jim Joe', description: 'Game of thrones character'}
    ]

    characters_attrs.each do |attrs|
      characters << Character.create(attrs)
    end

    visit '/characters'
    characters.each do |character|
      expect(page).to have_content character.name
      expect(page).to have_content character.actor
      expect(page).to have_content character.description
    end
  end
end

