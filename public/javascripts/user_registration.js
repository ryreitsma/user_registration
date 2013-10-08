jQuery(function() {
  function addTask(user) {
    jQuery('#users').append('<tr><td>' + user.name + '</td><td>' + user.email + '</td></tr>');
  }

  function clearErrors() {
    jQuery('input').removeClass('error');
    jQuery('.errorMsg').hide();
  }

  function handleError(responseJSON) {
    for (key in responseJSON) {
      var msg = t('errors.' + responseJSON[key][0]);
      jQuery('#user_' + key).addClass('error');
      jQuery('#user_' + key + '_error').text(msg).show();
    }
  }

  jQuery('#new_user').submit(function(e) {
    var self = this;

    clearErrors();

    jQuery.post('/users', jQuery(self).serialize(), addTask)
      .fail(function(data) { handleError(data.responseJSON); })
      .done(function() { self.reset(); });

    e.preventDefault();
  });

  jQuery.getJSON('/users', function(users) {
    jQuery.each(users, function() { addTask(this); });
  });

  jQuery('#container .yes').text(t('iWantThatApp'));
  jQuery('#user_name_label').text(t('users.name'));
  jQuery('#user_email_label').text(t('users.email'));
  jQuery('#users .header.name').text(t('users.name'));
  jQuery('#users .header.email').text(t('users.email'));
});

