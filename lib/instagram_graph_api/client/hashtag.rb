module InstagramGraphApi
  class Client
    module Hashtag
      def get_hashtag_details(hashtag_id, fields = nil, options: {})
        fields ||= "id,name"
        get_connections(hashtag_id, "?fields=#{fields}", options)
      end

      def get_recent_media(hashtag_id, ig_account_id, fields = nil, options: {})
        fields ||= "caption,children,comments_count,id,like_count,media_type,media_url,permalink"
        get_connections(hashtag_id, "recent_media?user_id=#{ig_account_id}&fields=#{fields}", options)
      end
    end
  end
end
