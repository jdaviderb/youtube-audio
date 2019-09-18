# frozen_string_literal: true

module YoutubeAudio
  class PlayerResponse
    attr_reader :script_player_url

    # @response_raw url [Hash]
    def initialize(response_raw, script_player_url: nil)
      @response_raw = response_raw
      @script_player_url = script_player_url
    end

    def formats
      (@response_raw&.dig('streamingData', 'adaptiveFormats') || []).map do |f|
        to_youtube_format(f)
      end
    end

    def to_youtube_format(format_raw)
      Format.new(format_raw, script_player_url: script_player_url)
    end
  end
end
