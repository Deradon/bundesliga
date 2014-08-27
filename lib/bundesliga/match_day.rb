module Bundesliga
  class MatchDay
    attr_reader :year
    attr_reader :day

    def initialize(year: year, day: day)
      @year = year || Time.now.year
      @day = day || 1
    end

    def matches
      @matches ||= parser.matches
    end

    def parser
      @parser ||= Bundesliga::MatchDayParser.new(url: url)
    end

    def url
      "http://www.bundesliga.de/de/liga/matches/#{year}/?md=#{day}"
    end
  end # -- MatchDay
end # -- Bundesliga
