# frozen_string_literal: true

module YoutubeAudio
  class Format
    def initialize(response_raw)
      @response_raw = response_raw
    end

    def audio?
      mime_type&.match?('audio/')
    end

    def url
      return UrlDecipher.new(cipher).decipher if cipher

      @response_raw&.dig('url')
    end

    def cipher
      @response_raw&.dig('cipher')
    end

    def mime_type
      @response_raw&.dig('mimeType')
    end

    def approx_duration_ms
      @response_raw&.dig('approxDurationMs')
    end

    def audio_quality
      @response_raw&.dig('audioQuality')
    end
  end
end
