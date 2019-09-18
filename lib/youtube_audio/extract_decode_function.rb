# frozen_string_literal: true

module YoutubeAudio
  class ExtractDecodeFunction
    attr_reader :player_script
    CIPHER_TEST = Regexp.new('([\\w$]+)\\s*=\\s*function\\((\\w+)\\)\\{\\s*\\2=\\s*\\2\\.split\\(""\\)\\s*;')

    def initialize(player_script)
      @player_script = player_script
    end

    def cipher_helper_object_name
      @cipher_helper_object_name ||=
        decipher_function.scan(/\;([a-zA-Z0-9]{0,255})\./).flatten.first
    end

    def cipher_helpers_object
      object_decibper_index = player_script.index("var #{cipher_helper_object_name}={")
      object_decibper_index_end = player_script[object_decibper_index..-1].index('};')
      player_script[object_decibper_index..object_decibper_index + object_decibper_index_end]
    end

    def decipher_function
      @decipher_function ||=
        player_script.scan(Regexp.new(function_pattern)).flatten.first
    end

    def decryption_function
      @decryption_function ||= player_script.scan(CIPHER_TEST).flatten.first
    end

    private

    def function_pattern
      @function_pattern ||=
        '(' + decryption_function + '=function\\([a-zA-Z0-9_]+\\)\\{.+?\\})'
    end
  end
end
