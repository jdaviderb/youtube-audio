# frozen_string_literal: true

module YoutubeAudio
  class PlayerResponse
    # @response_raw url [Hash]
    def initialize(response_raw)
      @response_raw = response_raw
    end

    def formats
      (@response_raw&.dig('streamingData', 'adaptiveFormats') || []).map do |f|
        to_youtube_format(f)
      end
    end

    def to_youtube_format(format_raw)
      Format.new(format_raw)
    end
  end
end
