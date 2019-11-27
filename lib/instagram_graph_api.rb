require "instagram_graph_api/version"
require "instagram_graph_api/client"
require 'uri'

module InstagramGraphApi
  # Your code goes here...
  def self.client(token)
    InstagramGraphApi::Client.new(token)
  end
end
