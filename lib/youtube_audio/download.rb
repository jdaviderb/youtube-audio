# frozen_string_literal: true

module YoutubeAudio
  class Download
    attr_reader :url

    def initialize(url)
      @url = url
    end
  end
end
