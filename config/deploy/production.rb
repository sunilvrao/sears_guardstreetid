
set :stage, :production
set :branch, "master"
set :domain, "34.217.59.171"

role :app, "34.217.59.171"
role :db, "34.217.59.171", :primary => true

set :deploy_to, "/home/ubuntu/sears_guardstreetid"
set :application_path, "/home/ubuntu/sears_guardstreetid"
set :rails_env, "production"

server '34.217.59.171',
       user: 'ubuntu',
       roles: %w{web app}

task :restart do
  on roles :all do
    execute "touch /home/ubuntu/sears_guardstreetid/current/tmp/restart.txt"
  end
end