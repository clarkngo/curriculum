if Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
  end
end

if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end

if Rails.env.productioon?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'                        # required
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
      aws_secret_access_key: ENV["AWS_SECRET_KEY"],        # required
    }
    config.fog_directory  = ENV["AWS_BUCKET"]              # required
  end
end
