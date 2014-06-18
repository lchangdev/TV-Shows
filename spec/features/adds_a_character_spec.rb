require 'rails_helper'

feature "user adds a new character on a TV show's page", %Q{
  As a site visitor
  I want to add my favorite TV show characters
  So that other people can enjoy their crazy antics
} do

#   Acceptance Criteria:
# * I can access a form to add a character on a TV show's page
# * I must specify the character's name and the actor's name
# * I can optionally provide a description
# * If I do not provide the required information, I receive an error message
# * If the character already exists in the database, I receive an error message

  scenario 'user adds a new character' do
    show = TelevisionShow.create(title: 'Game of Thrones', network: 'HBO', years: '2011-', synopsis: 'Seven noble families fight for control of the mythical land of Westeros.')
    attrs = {
      name: 'Rob Stark',
      actor: 'John Doe',
      description: 'Son of Ned Stark'
    }

    character = Character.new(attrs)

    visit "/television_shows/#{show.id}"
    fill_in 'Name', with: character.name
    fill_in 'Actor', with: character.actor
    fill_in 'Description', with: character.description
    click_on 'Submit'

    expect(page).to have_content 'Success'
    expect(page).to have_content character.name
    expect(page).to have_content character.actor
    expect(page).to have_content character.description
  end

  scenario 'without required attributes' do
    show = TelevisionShow.create(title: 'Game of Thrones', network: 'HBO', years: '2011-', synopsis: 'Seven noble families fight for control of the mythical land of Westeros.')

    character = Character.new
    visit "/television_shows/#{show.id}"
    click_on 'Submit'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "There was an error"
  end

  scenario 'user cannot add a character that is already in the database' do
    show = TelevisionShow.create(title: 'Game of Thrones', network: 'HBO', years: '2011-', synopsis: 'Seven noble families fight for control of the mythical land of Westeros.')

    attrs = {
      name: 'Rob Stark',
      actor: 'John Doe'
    }

    character = Character.create(attrs)

    visit "/television_shows/#{show.id}"
    fill_in 'Name', with: character.name
    fill_in 'Actor', with: character.actor
    click_on 'Submit'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "There was an error"
  end
end
