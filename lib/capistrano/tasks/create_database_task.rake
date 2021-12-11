# frozen_string_literal: true

namespace :deploy do

  desc 'Runs rake db:create if database are not set'
  task :create_database do
    on roles(:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          info 'Runs checking existed database'
          if fetch(:existed_database)
            info 'Database is existed'
          else
            info '[deploy:migrate] Run `rake db:create`'
            execute :rake, 'db:create'
          end
        end
      end
    end
  end

  before :migrate, :create_database

  desc 'Checks to see if the database exists'
  task :checking_existed_database do
    on roles(:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          Rake::Task['environment'].invoke
          ActiveRecord::Base.connection
        rescue StandardError
          set :existed_database, false
        else
          set :existed_database, true
        end
      end
    end
  end

  before :create_database, :checking_existed_database
end
