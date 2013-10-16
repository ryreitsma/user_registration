environment 'production'
daemonize true
pidfile '/var/lib/www/user_registration/current/tmp/pids/puma.pid'
stdout_redirect '/var/log/user_registration/log/stdout.log', '/var/log/user_registration/stderr.log', true
bind 'unix:///var/run/user_registration.sock'
