module InstagramGraphApi
  class Client
    module Media
      def user_recent_media(ig_account_id, type: "media", options: {})
        query = "#{type}?fields=comments_count,like_count,media_type,media_url,permalink,timestamp,thumbnail_url"
        query += "&after=#{options[:after]}" if options[:after]
        query += "&after=#{options[:before]}" if options[:before]
        get_connections(ig_account_id, query)
      end

      def media_details(media_id, fields = nil)
        fields ||= "comments_count,like_count,media_type,
                    media_url,permalink,timestamp,thumbnail_url,ig_id"
        get_connections(media_id , "?fields=#{fields}")
      end
    end
  end
end