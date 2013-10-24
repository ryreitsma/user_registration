require "capybara_spec_helper"

feature "Registering for the Coconut App", js: true do
  scenario "Registering with an invalid e-mail address is not allowed" do
    expected_error = I18n.t('user.email') + " " + I18n.t('errors.messages.not_matching')

    visit "/"

    fill_in(I18n.t('user.form.placeholders.name'), with: 'henk')
    fill_in(I18n.t('user.form.placeholders.email'), with: 'henk')
    expect(page).to have_no_content(expected_error)

    click_button I18n.t('user.form.submit')

    expect(page).to have_content(expected_error)
  end

  scenario "Registering without a name is not allowed" do
    expected_error = I18n.t('user.name') + " " + I18n.t('errors.messages.blank')

    visit "/"

    fill_in(I18n.t('user.form.placeholders.email'), with: 'henk@ogd.nl')
    expect(page).to have_no_content(expected_error)

    click_button I18n.t('user.form.submit')

    expect(page).to have_content(expected_error)
  end

  scenario "Registering with valid information" do
    expected_feedback = I18n.t('content.feedback')

    visit "/"

    fill_in(I18n.t('user.form.placeholders.name'), with: 'henk')
    fill_in(I18n.t('user.form.placeholders.email'), with: 'henk@ogd.nl')
    expect(page).to have_no_content(expected_feedback)

    click_button I18n.t('user.form.submit')

    expect(page).to have_content(expected_feedback)
  end
end
