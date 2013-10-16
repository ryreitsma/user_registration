
set :application, 'user_registration'
set :repo_url, 'https://github.com/coconut-ogd/user_registration.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/var/www/user_registration'
set :scm, :git
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do
  after :finishing, 'deploy:cleanup'
end
