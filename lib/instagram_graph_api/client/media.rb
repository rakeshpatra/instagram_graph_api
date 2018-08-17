module InstagramGraphApi
  class Client
    module Media
      attr_accessor :media_info, :insights

      METRIC_HASH = {
        image: 'impressions,reach',
        video: 'impressions,reach,video_views',
        story: 'impressions,replies,reach,taps_forward,taps_back,exits'
      }

      MEDIA_INFO_HASH = {
        image: "comments_count,like_count,media_type,"\
                    "media_url,permalink,timestamp,thumbnail_url",
        video: "comments_count,like_count,media_type,"\
                    "media_url,permalink,timestamp,thumbnail_url",
        story: "media_type,media_url,permalink,"\
                      "timestamp,thumbnail_url"
      }

      def get_user_recent_media(id, type: "image", options: {})
        entity = type.eql?("story") ? "stories" : "media"
        query = "#{entity}?fields=#{MEDIA_INFO_HASH[type.to_sym]}"
        query += "&after=#{options[:after]}" if options[:after]
        query += "&before=#{options[:before]}" if options[:before]
        get_connections(id, query)
      end

      def get_media_details(media_id, fields = nil)
        fields ||= "comments_count,like_count,media_type,
                    media_url,permalink,timestamp,thumbnail_url,ig_id"
        get_connections(media_id , "?fields=#{fields}")
      end

      def insight(type)
        get_insights
        if insights
          insight = insights.select{|m| m["name"] == type}.first
          data = if insight
                   insight
                 else
                   try(type).first
                 end

          data["values"].first["value"]
        end
      end

    private
      def get_insights
        @insights = get_connections(media_id , "insights?metric=#{METRIC_HASH[type.to_sym]}")
      end
    end
  end
end