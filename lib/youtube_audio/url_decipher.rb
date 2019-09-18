# frozen_string_literal: true

module YoutubeAudio
  class UrlDecipher
    attr_reader :cipher, :script_player_url

    def initialize(cipher, script_player_url:)
      @cipher = cipher
      @script_player_url = script_player_url
    end

    def decipher
      decoded = CGI.parse(@cipher)

      sign = Decipher.new(script_player_url).decipher(decoded.dig('s').first)

      decoded.dig('url').first + '&' + decoded.dig('sp').first + "=#{sign}"
    end
  end
end
