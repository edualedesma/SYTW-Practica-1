def my_twitter_client
  Twitter::REST::Client.new do |config|
    config.consumer_key        = 'k90EbkYddMO8bIjUEJFDUtd4A'
    config.consumer_secret     = 'G2zzvz7EwKqZ05tGgIh7cqZezykT1NjYhAcDmHzmmcDxH8Iw7A'
    config.access_token        = '296371486-A2dJdoLx29TurMPTBYOO23IAWezSDFtqtIdgjs3C'
    config.access_token_secret = 'UFNR4ihP69MamHe4PdDTZYcooCo7VD5F04eG2F3dE6S8L'
  end
end
