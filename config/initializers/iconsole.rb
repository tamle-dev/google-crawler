Iconsole.configure do |config|
  config.username     = ENV.fetch('ICONSOLE_USERNAME', 'admin-iconsole')
  config.md5_password = ENV.fetch('ICONSOLE_MD5_PASSWORD', Digest::MD5.hexdigest('iconsole'))
end
