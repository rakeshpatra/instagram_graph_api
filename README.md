# InstagramGraphApi

A gem for Instagram Graph API using [koala](https://github.com/arsduo/koala).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'instagram_graph_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install instagram_graph_api

## Usage

```ruby
client = InstagramGraphApi.client(ACCESS_TOKEN)

#get an arraay of business accounts linked to the access_token
client.ig_business_accounts
#get an array of connected IG accounts linked to the access_token
client.connected_ig_accounts

#to get specific fields from "id,name,biography,ig_id,followers_count,profile_picture_url,username"
client.ig_business_accounts("name,followers_count")
client.connected_ig_accounts("name,followers_count")

#get IG business account/ Connected IG account info
client.get_account_info(IG_BUSINESS_ID)
#to get specific fields
fields = "name, biography"
client.get_account_info(IG_BUSINESS_ID, fields)

#get media list
client.get_user_recent_media(IG_BUSINESS_ID)

#get media details
client.get_media_details(MEDIA_ID)
#to get specific fields
fields  = "media_url, permalink"
client.get_media_details(MEDIA_ID, fields)

#Discover business user
client.discover_user(USERNAME)
# fields can be from "id,followers_count,media_count,ig_id"
fields = "followers_count,media_count,ig_id"
client.discover_user(USERNAME, fields)

#discover user media, fields can be "caption,media_url,media_type,like_count,comments_count,id"
client.discover_user_media(USERNAME, fields)

#Search for a tag, 
client.tag_media(page_token, tag_name)
#fields can be "media_type,comments_count,like_count,media_url,permalink"
fields="media_url,permalink"
client.tag_media(page_token, tag_name, fields)
#custom edge can be provided, default is 'top_media'
tag_media = client.tag_media(page_token, tag_name, edge: "recent_media")
# Note: We can run `tag_media.next_page` to fetch next set of results
# additional arguent options can also be passed for page params i.e before/after/limit etc
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rakeshpatra/instagram_graph_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the InstagramGraphApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rakeshpatra/instagram_graph_api/blob/master/CODE_OF_CONDUCT.md).
