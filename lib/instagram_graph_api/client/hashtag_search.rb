module InstagramGraphApi
  class Client
    module HashtagSearch
      def get_hashtag_ids(ig_account_id, hashtag_name, options: {})
        q = URI.encode(hashtag_name)
        query = "ig_hashtag_search?user_id=#{ig_account_id}&q=#{q}"
        get_connections('', query)
      end
    end
  end
end
