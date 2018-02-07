
set :stage, :production
set :branch, "master"
set :domain, "gslanding.com"

role :app, "gslanding.com"
role :db, "gslanding.com", :primary => true

set :deploy_to, "/home/ubuntu/sears_guardstreetid"
set :application_path, "/home/ubuntu/sears_guardstreetid"
set :rails_env, "production"

server 'gslanding.com',
       user: 'ubuntu',
       roles: %w{web app}

task :restart do
  on roles :all do
    execute "touch /home/ubuntu/sears_guardstreetid/current/tmp/restart.txt"
  end
end
