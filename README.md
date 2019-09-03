<p align="center" style="font-weight: bold; font-size: 12px;">
  This gem can extract videos from youtube in audio format using webscraping techniques
</p>

<a href="https://codeclimate.com/github/jdaviderb/youtube-audio/maintainability"><img src="https://api.codeclimate.com/v1/badges/9ff835347572374cb547/maintainability" /></a> [![Build Status](https://travis-ci.org/jdaviderb/youtube-audio.svg?branch=master)](https://travis-ci.org/jdaviderb/youtube-audio) <a href="https://codeclimate.com/github/jdaviderb/youtube-audio/test_coverage"><img src="https://api.codeclimate.com/v1/badges/9ff835347572374cb547/test_coverage" /></a>


# Features :rocket:

### Download a video in audio format :musical_note:
```ruby
require 'youtube_audio'

youtube = YoutubeAudio::Download.new('https://www.youtube.com/watch?v=xoWRkd3oGcs')

puts youtube.formats # Array<YoutubeAudio::Format>

# =>
# [
#   {
#     "url": "https://r7---sn-ja5gvjv-cvbl.googlevideo.com/vide.........",
#     "mime_type": "audio/mp4;",
#     "audio_quality": "AUDIO_QUALITY_MEDIUM",
#     "approx_duration_ms": "317068"

#   }
# ]
```

### Search videos in youtube :squirrel:

```ruby
require 'youtube_audio'

search_items = YoutubeAudio::Search.new('la vida boheme - flamingo').results # Array<YoutubeAudio::Format>

puts search_items.first.title # La Vida Boheme - Flamingo
puts search_items.first.description # Official Music Video
puts search_items.first # Array<YoutubeAudio::Format>

# =>
# [
#   {
#     "url": "https://r7---sn-ja5gvjv-cvbl.googlevideo.com/vide.........",
#     "mime_type": "audio/mp4;",
#     "audio_quality": "AUDIO_QUALITY_MEDIUM",
#     "approx_duration_ms": "317068"

#   }
# ]
```

# Installation

Add this line to your application's Gemfile:

```ruby
gem 'youtube_audio'
```
Or install it yourself as:

    $ gem install youtube_audio


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jdaviderb/youtube-audio. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
