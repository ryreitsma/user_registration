jQuery(function() {
  function addTask(user) {
    jQuery('#users').append('<tr><td>' + user.name + '</td><td>' + user.email + '</td></tr>');
  }

  jQuery('#new_user').submit(function(e) {
    jQuery.post('/users', jQuery(this).serialize(), addTask);
    this.reset();
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

