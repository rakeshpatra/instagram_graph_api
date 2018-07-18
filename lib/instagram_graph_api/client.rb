require 'koala'

module InstagramGraphApi
  class Client < Koala::Facebook::API
    # attr_accessor :media_info, :insights

    def initialize(media_id = nil, access_token)
      super(access_token)
    end

    def get_pages(params="")
      begin
        get_connections('me', "accounts#{params}")
      rescue Exception => e
        check_access_token(e)
        Rails.logger.error(e)
        []
      end
    end

    def get_ig_business_accounts(params = nil)
      params ||= 'id,name,biography, ig_id, followers_count, profile_picture_url,username'
      accounts = get_pages("?fields=instagram_business_account{#{params}}")
      accounts.map{|a| a["instagram_business_account"].merge(page_id: a["id"]) if a["instagram_business_account"]}.compact
    end

    def get_account_info(ig_account_id, fields = [])
      fields = [:biography, :followers_count, :ig_id, :name,
                :profile_picture_url, :username, :id] if fields.blank?
      get_connections(ig_account_id , "?fields=#{fields.map(&:to_s).join(',')}")
    end

    def get_recent_media(ig_account_id, type: "media", options: {})
      query = "#{type}?fields=comments_count,like_count,media_type,media_url,permalink,timestamp,thumbnail_url"
      query += "&after=#{options[:after]}" if options[:after]
      query += "&after=#{options[:before]}" if options[:before]
      get_connections(ig_account_id, query)
    end
  end
end