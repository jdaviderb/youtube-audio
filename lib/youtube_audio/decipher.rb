# frozen_string_literal: true

module YoutubeAudio
  class Decipher
    attr_reader :script_player_url
    URL = 'https://www.youtube.com'

    def initialize(script_player_url)
      @script_player_url = script_player_url
    end

    # @param cipher [string] youtube signature
    def decipher(cipher)
      klass = extract_decode_function_handler
      miniracer_klass = miniracer_context

      miniracer_klass.eval(klass.cipher_helpers_object)
      miniracer_klass.eval("var #{klass.decipher_function}")
      miniracer_klass.eval("#{klass.decryption_function}('#{cipher}')")
    end

    private

    def extract_decode_function_handler
      @extract_decode_function_handler ||=
        ExtractDecodeFunction.new(script_player_content)
    end

    def miniracer_context
      MiniRacer::Context.new
    end

    def script_player_content
      @script_player_content ||= Net::HTTP.get(URI(URL + script_player_url))
    end
  end
end
