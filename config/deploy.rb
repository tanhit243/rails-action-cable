# config valid for current version and patch releases of Capistrano
lock '~> 3.14.1'

set :application, 'action_cable_rails'
set :repo_url, 'git@github.com:tanhit243/rails-action-cable.git'

# Capistrano rails
set :rails_env, 'production'
set :conditionally_migrate, true

# Capistrano bundler
set :bundle_binstubs, -> { shared_path.join('bin') }
set :bundle_flags, ''

# Capistrano rbenv
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} /usr/bin/rbenv exec"
set :rbenv_ruby, File.read('.ruby-version').strip

# Capistrano puma
set :user, ENV['USER_DEPLOY']
set :puma_threads, [4, 16]
set :puma_workers, 0
set :stage, :production
set :nginx_config_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :nginx_ssl_certificate, "/etc/ssl/#{fetch(:nginx_config_name)}.crt"
set :nginx_ssl_certificate_key, "/etc/ssl/#{fetch(:nginx_config_name)}.key"
set :nginx_use_ssl, true
set :nginx_use_http2, false
set :nginx_server_name, ENV['DOMAIN_NAME']

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads', '.bundle'
append :linked_files, 'config/database.yml', 'config/master.key', 'config/credentials.yml.enc', '.env'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
