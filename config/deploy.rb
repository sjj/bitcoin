require "whenever/capistrano"

set :application, "bitcoin"
set :repository,  "set your repository location here"

set :default_env, 'production'
set :rails_env, ENV['rails_env'] || ENV['RAILS_ENV'] || default_env

set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run
role :db,  "localhost"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts


# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end


namespace :deploy do
  desc "Update the crontab file"
  task :update_crontab, :roles => :db do
    run "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/var/lib/gems/1.8/bin:/usr/bin:/sbin:/bin:/usr/games:/usr/bin && cd #{release_path} && bundle exec whenever --update-crontab #{application}"
  end
end