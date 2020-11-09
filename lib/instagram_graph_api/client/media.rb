module InstagramGraphApi
  class Client
    module Media
      attr_accessor :media_info, :raw_insights

      MEDIA_INFO_HASH = {
        image: "comments_count,like_count,media_type,"\
                    "media_url,permalink,timestamp,thumbnail_url",
        video: "comments_count,like_count,media_type,"\
                    "media_url,permalink,timestamp,thumbnail_url",
        story: "media_type,media_url,permalink,"\
                      "timestamp,thumbnail_url"
      }

      def get_user_recent_media(id, fields = nil, type: "image", options: {})
        entity = type.eql?("story") ? "stories" : "media"
        fields ||= MEDIA_INFO_HASH[type.to_sym]
        query = "#{entity}?fields=#{fields}"
        query += "&after=#{options[:after]}" if options[:after]
        query += "&before=#{options[:before]}" if options[:before]
        get_connections(id, query)
      end

      def get_media_details(media_id, fields = nil, type: "image")
        fields ||= MEDIA_INFO_HASH[type.to_sym]
        get_connections(media_id , "?fields=#{fields}")
      end

    end
  end
end