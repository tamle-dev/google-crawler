if Rails.env.test?
  CarrierWave.configure do |config|
    config.enable_processing = false
    config.storage = :file
  end
else
  if ENV['GCS_CRED_CONTENT']
    CarrierWave.configure do |config|
      config.fog_provider = 'fog/google'
      config.fog_credentials = {
        provider: 'Google',
        google_project: ENV.fetch('GCS_PROJECT', 'google-crawler-project'),
        google_json_key_string: ENV['GCS_CRED_CONTENT']
      }
      config.fog_directory = ENV.fetch('GCS_BUCKET', 'crawler-b1')
      config.asset_host = ENV['ASSET_HOST']
      config.storage = :fog
    end
  end
end
