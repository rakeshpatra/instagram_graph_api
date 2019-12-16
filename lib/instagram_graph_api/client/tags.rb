module InstagramGraphApi
  class Client
    module Tags
      def get_user_tags(ig_account_id, fields = nil, options: {})
        fields ||= 'caption,children,comments_count,id,like_count,media_type,media_url,permalink,timestamp,username'
        query = "tags?fields=#{fields}"
        query += "&after=#{options[:after]}" if options[:after]
        query += "&before=#{options[:before]}" if options[:before]
        query += "&limit=#{options[:limit]}" if options[:limit]
        get_connections(ig_account_id, query)
      end
    end
  end
end
