require "capybara_spec_helper"

feature "Registering for the Coconut App", js: true do
  scenario "Registering without an e-mail address is not allowed" do
    expected_error = "email can't be blank"

    visit "/"

    fill_in('uw naam', with: 'henk')
    expect(page).to have_no_content(expected_error)

    click_button 'Save'

    expect(page).to have_content(expected_error)
  end

  scenario "Registering with an invalid e-mail address is not allowed" do
    expected_error = "email is not valid"

    visit "/"

    fill_in('uw naam', with: 'henk')
    fill_in('uw e-mail adres', with: 'henk')
    expect(page).to have_no_content(expected_error)

    click_button 'Save'

    expect(page).to have_content(expected_error)
  end

  scenario "Registering without a name is not allowed" do
    expected_error = "name can't be blank"

    visit "/"

    fill_in('uw e-mail adres', with: 'henk@ogd.nl')
    expect(page).to have_no_content(expected_error)

    click_button 'Save'

    expect(page).to have_content(expected_error)
  end

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
