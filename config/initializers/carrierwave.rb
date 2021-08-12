if Rails.env.test?
  CarrierWave.configure do |config|
    config.enable_processing = false
    config.storage = :file
  end
else
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/google'
    config.fog_credentials = {
      provider: 'Google',
      google_project: Rails.application.secrets.google_cloud_storage_project_name,
      google_json_key_string: Rails.application.secrets.google_cloud_storage_credential_content
    }
    config.fog_directory = Rails.application.secrets.google_cloud_storage_bucket_name
    config.asset_host = ENV['ASSET_HOST']
    config.storage = :fog
  end
end
