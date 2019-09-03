# frozen_string_literal: true

module YoutubeAudio
  class SearchItem
    def initialize(element)
      @element = element
    end

    def title
      @element.search(".yt-lockup-title a").text
    end

    def description
      @element.search(".yt-lockup-description").text
    end

    def formats
      video = @element.search('.yt-uix-tile-link').first['href']
      @formats ||= Formats.new("https://youtube.com#{video}").formats
    end
  end
end
