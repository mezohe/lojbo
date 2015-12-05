# Change to match your CPU core count
workers 1

# Min and Max threads per worker
threads 1, 5

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"

# Default to production
rails_env = ENV["RAILS_ENV"] || "production"
environment rails_env

# Set up socket location
bind "unix://#{shared_dir}/sockets/puma.sock"

# Logging
out_log_location = "#{shared_dir}/log/puma.stdout.log"
err_log_location = "#{shared_dir}/log/puma.stderr.log"
stdout_redirect out_log_location, err_log_location, true

# Set master PID and state locations
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"
activate_control_app

on_worker_boot do
  require "active_record"
  begin
    ActiveRecord::Base.connection.disconnect!
  rescue
    ActiveRecord::ConnectionNotEstablished
  end
  location = "#{app_dir}/config/database.yml"
  ActiveRecord::Base.establish_connection(YAML.load_file(location)[rails_env])
end
