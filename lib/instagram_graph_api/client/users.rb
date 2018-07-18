module InstagramGraphApi
  class Client
    module Users
      def ig_business_accounts(fields = nil)
        fields ||= 'id,name,biography, ig_id, followers_count, profile_picture_url,username'
        accounts = get_pages("?fields=instagram_business_account{#{fields}}")
        accounts.map do |a|
          a["instagram_business_account"].merge(page_id: a["id"]) if a["instagram_business_account"]
        end.compact
      end

      def get_account_info(ig_account_id, fields = nil)
        fields ||= "biography,followers_count,ig_id,name,profile_picture_url,username,id"
        get_connections(ig_account_id , "?fields=#{fields}")
      end

      private

      def get_pages(params="")
        begin
          get_connections('me', "accounts#{params}")
        rescue Exception => e
          puts e.message
          []
        end
      end

      def get_business_account_id
        ig_business_accounts.first.dig('id')
      end
    end
  end
end