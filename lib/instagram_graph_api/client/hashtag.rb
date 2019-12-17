module InstagramGraphApi
  class Client
    module Hashtag
      def get_hashtag_details(hashtag_id, fields = nil, options: {})
        fields ||= "id,name"
        get_connections(hashtag_id, "?fields=#{fields}", options)
      end

      def get_hashtag_recent_media(hashtag_id, ig_account_id, fields = nil, options: {})
        fields ||= "caption,children,comments_count,id,like_count,media_type,media_url,permalink"
        query = "recent_media?user_id=#{ig_account_id}&fields=#{fields}"
        query += "&after=#{options[:after]}" if options[:after]
        query += "&before=#{options[:before]}" if options[:before]
        query += "&limit=#{options[:limit]}" if options[:limit]
        get_connections(hashtag_id, query)
      end
    end
  end
end
