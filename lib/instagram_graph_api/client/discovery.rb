module InstagramGraphApi
  class Client
    module Discovery
      def discover_user(username, fields = nil)
        fields ||= "id,followers_count,media_count,ig_id"
        bg_id = get_business_account_id
        raise "No business-account found, you need to have atleast one IG business-account" unless bg_id
        query = "?fields=business_discovery.username(#{username}){#{fields}}"
        get_connections(bg_id, query)
      rescue Exception => e
        puts e.message
      end

      def discover_user_media(username, fields = nil, options={})
        fields ||= "caption,media_url,media_type,like_count,comments_count,id"
        page_options = ".after(#{options['after']})" if options["after"]
        page_options = ".after(#{options['before']})" if options["before"]
        discover_user(username, "media#{page_options}{#{fields}}")
      end
    end
  end
end