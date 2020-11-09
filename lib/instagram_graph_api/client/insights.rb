module InstagramGraphApi
  class Client
    module Insights

      METRIC_HASH = {
        image: 'impressions,reach',
        video: 'impressions,reach,video_views',
        story: 'impressions,replies,reach,taps_forward,taps_back,exits'
      }

      def insights(object_id, type: "image", metrics: nil)
        metrics ||= METRIC_HASH[type.to_sym]
        @raw_insights = get_connections(object_id, "insights?metric=#{metrics}")
        @raw_insights.reduce({}) do |result, insight_data|
          result[insight_data["name"]] = insight_data["values"].first["value"]
          result
        end
      end
    end
  end
end