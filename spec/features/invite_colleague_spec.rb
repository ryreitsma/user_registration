require "capybara_spec_helper"

feature "Inviting multiple colleagues to the Coconut App", js: true do
  scenario "Inviting with an invalid e-mail address is not allowed" do
    expected_error = I18n.t('invitation.recipient_email') + " " + I18n.t('errors.messages.not_matching')

    visit "/"

    fill_in(I18n.t('invitation.inviter_name'), with: 'henk')
    fill_in(I18n.t('invitation.recipient_name'), with: 'henk')
    fill_in(I18n.t('invitation.recipient_email'), with: 'henk')
    expect(page).to have_no_content(expected_error)

    click_button I18n.t('invitation.invite')

    expect(page).to have_content(expected_error)
  end

  scenario "Inviting without an inviter name is not allowed" do
    expected_error = I18n.t('invitation.inviter_name') + " " + I18n.t('errors.messages.blank')

    visit "/"

    fill_in(I18n.t('invitation.inviter_name'), with: '')
    fill_in(I18n.t('invitation.recipient_name'), with: 'henk')
    fill_in(I18n.t('invitation.recipient_email'), with: 'henk@ogd.nl')
    expect(page).to have_no_content(expected_error)

    click_button I18n.t('invitation.invite')

    expect(page).to have_content(expected_error)
  end

  scenario "Inviting without a recipient name is not allowed" do
    expected_error = I18n.t('invitation.recipient_name') + " " + I18n.t('errors.messages.blank')

    visit "/"

    fill_in(I18n.t('invitation.inviter_name'), with: 'henk')
    fill_in(I18n.t('invitation.recipient_name'), with: '')
    fill_in(I18n.t('invitation.recipient_email'), with: 'henk@ogd.nl')
    expect(page).to have_no_content(expected_error)

    click_button I18n.t('invitation.invite')

    expect(page).to have_content(expected_error)
  end

  scenario "Inviting with valid information" do
    expected_feedback = I18n.t('content.invite.feedback')

    visit "/"

    fill_in(I18n.t('invitation.inviter_name'), with: 'henk')
    fill_in(I18n.t('invitation.recipient_name'), with: 'henk')
    fill_in(I18n.t('invitation.recipient_email'), with: 'henk@ogd.nl')
    expect(page).to have_no_content(expected_feedback)

    click_button I18n.t('invitation.invite')

    expect(page).to have_content(expected_feedback)
  end

  scenario "Inviting two colleagues with valid information" do
    expected_feedback = I18n.t('content.invite.feedback')

    visit "/"

    fill_in(I18n.t('invitation.inviter_name'), with: 'henk')
    fill_in(I18n.t('invitation.recipient_name'), with: 'henk')
    fill_in(I18n.t('invitation.recipient_email'), with: 'henk@ogd.nl')
    expect(page).to have_no_content(expected_feedback)

    click_button I18n.t('invitation.invite')

    expect(page).to have_content(expected_feedback)

    fill_in(I18n.t('invitation.inviter_name'), with: 'henk2')
    fill_in(I18n.t('invitation.recipient_name'), with: 'henk2')
    fill_in(I18n.t('invitation.recipient_email'), with: 'henk2@ogd.nl')
    expect(page).to have_no_content(expected_feedback)

    click_button I18n.t('invitation.invite')

    expect(page).to have_content(expected_feedback)
  end
end

#todo nog 2 keer achter elkaar een invite doen!