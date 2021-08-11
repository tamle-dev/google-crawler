#
# We need to separate between Rails applications and between environments, because maybe we will
# use the same Redis server in the future.
#
Rails.application.config.active_job.queue_adapter = :sidekiq

uri = ENV['REDIS_URL'] || 'redis://localhost:6379/8'
app_name = File.basename(Rails.root.to_s)

Sidekiq.configure_server do |config|
  config.redis = { url: uri, namespace: "#{app_name}_#{Rails.env}", id: nil }

  schedule_file = 'config/schedule.yml'
  if File.exist?(schedule_file) && Sidekiq.server?
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: uri, namespace: "#{app_name}_#{Rails.env}", id: nil }
end
