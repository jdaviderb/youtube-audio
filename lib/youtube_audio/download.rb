# frozen_string_literal: true

module YoutubeAudio
  class Download
    # @return [String]
    attr_reader :url

    # @param url [String] youtube link
    def initialize(url)
      @url = url
    end

    def formats
      @formats ||= Formats.new(url).formats
    end
  end
end
