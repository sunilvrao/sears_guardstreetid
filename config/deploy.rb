# config valid only for Capistrano 3.1
lock '3.10.1'

set :repo_url, "git@github.com:sunilvrao/sears_guardstreetid.git"
set :rvm_ruby_version, 'ruby-2.2.1'

set :scm, :git
set :deploy_via, :remote_cache
set :branch, "master"
set :default_stage, "production"

set :use_sudo, false
set :keep_releases, 3

set :port, 22

set :ssh_options, {
                    config: false
                }

#set :linked_files, %w(config/database.yml config/secrets.yml)

after 'deploy', 'deploy:restart', "deploy:cleanup"
#before 'deploy:migrate', 'deploy:bundle'


namespace :deploy do
  #before :deploy, "deploy:check_revision"
  #after :deploy, "deploy:restart"
  #after :rollback, "deploy:restart"
  #desc "Creating database file."
  #task :db_create, :roles => :app, :except => { :no_release => true } do
  #   within "#{current_path}" do
  #      run "cd #{application_path}/current; rake db:create"
  #   end
  #end

  task :restart do
    on roles :all do
      execute "touch /home/ubuntu/sears_guardstreetid/current/tmp/restart.txt"
    end
  end

end



#after 'deploy:update', 'deploy:restart'
#before 'deploy:migrate', 'deploy:bundle'

=begin
namespace :deploy do

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  after :publishing, :restart
end
=end
