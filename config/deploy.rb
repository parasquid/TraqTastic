require "bundler/capistrano"
load 'deploy/assets'

$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.9.3-p0'        # Or whatever env you want it to run in.

set :application, "TraqTastic"
set :repository,  "git@github.com:parasquid/TraqTastic.git"
set :use_sudo, false
set :user, "tristan"
set :port, 20022
set :deploy_to, "/home/tristan/apps/#{application}"
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "traqtastic.com"                          # Your HTTP server, Apache/etc
role :app, "traqtastic.com"                          # This may be the same as your `Web` server

namespace :deploy do
  task :start, :roles => :app do
    run "sudo rm -f /etc/nginx/sites-enabled/#{pid}.nginx.conf"
    run "sudo ln -s #{deploy_to}/current/config/#{application}.nginx.conf /etc/nginx/sites-enabled"
    run "sudo /etc/init.d/nginx restart"
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end