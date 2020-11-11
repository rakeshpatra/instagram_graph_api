module InstagramGraphApi
  class Client
    module Tag
      def tag_media(page_token, tag_name, fields = nil, edge: "top_media", options: {})
        user_id = get_ig_id_from_token(page_token)
        tag_info = graph_call("ig_hashtag_search?user_id=#{user_id}&q=#{tag_name}")[0]
        fields ||= "id,media_type,comments_count,like_count,media_url,permalink"
        query = "#{edge}?user_id=#{user_id}&fields=#{fields}"
        query += options.reduce(""){|s, (k, v)| s+= "&#{k}=#{v}" }
        get_connections(tag_info["id"], query)
      end

      private

      def get_ig_id_from_token(token)
        account_info = get_connections('me', "?fields=connected_instagram_account")
        account_info.dig("connected_instagram_account", "id")
      end
    end
  end
end
