# frozen_string_literal: true

module YoutubeAudio
  class Search
    attr_reader :keywords

    def initialize(keywords)
      @keywords = keywords
    end

    def results
      selector = '.section-list li ol.item-section li .yt-lockup-tile'
      search_url = 'https://www.youtube.com/results?search_query='
      @results ||= agent.get(search_url + CGI.escape(keywords))
                        .search(selector)
                        .map { |element| to_search_item(element) }
    end

    private

    def to_search_item(element)
      SearchItem.new(element)
    end

    # @return [Mechanize]
    def agent
      @agent ||= ::Mechanize.new
      @agent.user_agent = user_agent
      @agent
    end

    def user_agent
      'Mozilla/4.0 (compatible; MSIE 8.0; ' \
        'Windows NT 6.0; WOW64; Trident/4.0; SLCC1)'
    end
  end
end
