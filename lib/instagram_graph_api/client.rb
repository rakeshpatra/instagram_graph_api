require 'koala'

module InstagramGraphApi
  class Client < Koala::Facebook::API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include InstagramGraphApi::Client::Insights
    include InstagramGraphApi::Client::Users
    include InstagramGraphApi::Client::Media
    include InstagramGraphApi::Client::Discovery
    include InstagramGraphApi::Client::Tag
  end
end