# frozen_string_literal: true

module YoutubeAudio
  class ScriptParser
    # @param script [String]
    def initialize(script)
      @script = script
    end

    # @return [YoutubeAudio::PlayerResponse]
    def player_response
      mini_racer_context = MiniRacer::Context.new
      # initialize mandatory variables to can parsed the youtube script
      mini_racer_context.eval('window = {}; function setTimeout() {}')
      # parse youtube script
      mini_racer_context.eval(@script)
      # get player response ...
      response = mini_racer_context.eval('ytInitialPlayerConfig')

      PlayerResponse.new(
        JSON.parse(response['args']['player_response']),
        script_player_url: response['assets']['js']
      )
    end
  end
end
