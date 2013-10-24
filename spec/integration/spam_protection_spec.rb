require "capybara_spec_helper"

feature "Spam protection", js: true do
  include Capybara::DSL

  scenario "Registering with valid information" do
    expected_feedback = I18n.t('content.feedback')

    visit "/"

    fill_in(I18n.t('user.form.placeholders.name'), with: 'henk')
    fill_in(I18n.t('user.form.placeholders.email'), with: 'henk@ogd.nl')
    expect(page).to have_no_content(expected_feedback)

    expect {
      click_button I18n.t('user.form.submit')

      expect(page).to have_content(expected_feedback)
    }.to change { User.count }.by(1)
  end

  scenario "Attempting to use the form for spam does not work" do
    expected_feedback = I18n.t('content.feedback')

    visit "/"

    page.execute_script <<-SCRIPT
      jQuery('input').show();
    SCRIPT

    fill_in(I18n.t('user.form.placeholders.name'), with: 'henk')
    fill_in(I18n.t('user.form.placeholders.email'), with: 'henk@ogd.nl')
    fill_in(Rails.application.config.honeypot_field_name, with: 'henk')

    expect(page).to have_no_content(expected_feedback)

    expect {
      click_button I18n.t('user.form.submit')

      # IMPORTANT: we want the app to fake a success
      expect(page).to have_content(expected_feedback)
    }.not_to change { User.count }
  end
end
