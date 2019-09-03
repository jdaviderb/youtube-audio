# frozen_string_literal: true

module YoutubeAudio
  class UrlDecipher
    attr_reader :cipher

    def initialize(cipher)
      @cipher = cipher
    end

    def decipher
      decoded = CGI.parse(@cipher)

      signature = Decipher.new.decipher(decoded.dig('s').first)
      decoded.dig('url').first + '&' + decoded.dig('sp').first + "=#{signature}"
    end
  end
end
