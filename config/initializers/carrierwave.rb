require 'carrierwave-aws'

CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'imagestager' 

  config.aws_credentials = {
    access_key_id:     'AKIAJ62Y2DRI4RKVF3ZA',
    secret_access_key: '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',
    region:            'eu-west-2'
    
  }

end