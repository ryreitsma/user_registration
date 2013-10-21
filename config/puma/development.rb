directory '/var/www/user_registration/current'
environment 'development'
daemonize true
stdout_redirect '/var/log/user_registration/puma_out.log', '/var/log/user_registration/puma_error.log', true
bind 'unix:///var/run/user_registration/puma.sock'
state_path '/var/run/user_registration/puma.state'
pidfile '/var/run/user_registration/puma.pid'