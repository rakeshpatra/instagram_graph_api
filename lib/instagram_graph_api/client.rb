require 'koala'

module InstagramGraphApi
  class Client < Koala::Facebook::API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include InstagramGraphApi::Client::Users
    include InstagramGraphApi::Client::Media
    include InstagramGraphApi::Client::Discovery

    def initialize(media_id = nil, access_token)
      super(access_token)
    end
  end
end