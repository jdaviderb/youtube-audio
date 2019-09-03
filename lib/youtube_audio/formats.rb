# frozen_string_literal: true

module YoutubeAudio
  class Formats
    # @return [String]
    attr_reader :url

    # @param url [String] youtube link
    def initialize(url)
      @url = url
    end

    def formats
      player_response.formats.select(&:audio?)
    end

    def player_response
      @player_response ||= ScriptParser.new(script_js).player_response
    end

    private

    def script_js
      @script_js ||= script
    end

    def page
      @page ||= agent.get(url)
    end

    # returns a script that contains youtube audio / video metadata
    # @return [String]
    def script
      @script ||= page.search('script').select do |html_content|
        html_content.inner_html.match('ytInitialPlayerConfig = {')
      end&.first&.content
    end

    # @return [Mechanize]
    def agent
      @agent ||= ::Mechanize.new
      @agent.user_agent = user_agent
      @agent
    end

    def user_agent
      'Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36'
    end
  end
end
