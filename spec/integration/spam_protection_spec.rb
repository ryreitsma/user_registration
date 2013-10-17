require "capybara_spec_helper"

feature "Spam protection", js: true do
  include Capybara::DSL

  scenario "Registering with valid information" do
    expected_feedback = "We hebben uw registratie ontvangen"

    visit "/"

    fill_in('uw naam', with: 'henk')
    fill_in('uw e-mail adres', with: 'henk@ogd.nl')
    expect(page).to have_no_content(expected_feedback)

    expect {
      click_button 'Save'

      expect(page).to have_content(expected_feedback)
    }.to change { User.count }.by(1)
  end

  scenario "Attempting to use the form for spam does not work" do
    expected_feedback = "We hebben uw registratie ontvangen"

    visit "/"

    fill_in('uw naam', with: 'henk')
    fill_in('uw e-mail adres', with: 'henk@ogd.nl')
    fill_in(Rails.application.config.honeypot_field_name, with: 'henk')

    expect(page).to have_no_content(expected_feedback)

    expect {
      click_button 'Save'

      # IMPORTANT: we want the app to fake a success
      expect(page).to have_content(expected_feedback)
    }.not_to change { User.count }
  end
end
