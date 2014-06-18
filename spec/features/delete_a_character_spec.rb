require 'rails_helper'

feature "user deletes a character detail", %Q{
  As a site visitor
  I want to delete a character I don't like
  So no one else will want to watch that character
} do

  # Acceptance Criteria:
  # * I can delete a character from the database
  # * If the record is not successfully deleted, I receive an error message
  scenario "user deletes a character" do
    attrs = {
      name: 'Rob Stark',
      actor: 'John Doe',
      description: 'Son of Ned Stark'
    }

    character = Character.create(attrs)

    visit '/characters'
    click_link('delete')

    expect(page).to have_content 'Deleted'
    expect(page).to_not have_content 'Error'
  end
end
