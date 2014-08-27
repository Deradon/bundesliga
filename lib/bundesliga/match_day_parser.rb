require 'date'
require 'nokogiri'
require 'net/http'

module Bundesliga
  class MatchDayParser
    attr_reader :url

    def initialize(url: url)
      @url = url or raise ArgumentError.new("You must provide a URL.")
    end

    def matches
      spieltage.map do |html_match|
        divs = html_match.css('div')
        teams_raw = divs[1].text.split("\n").map { |e| e.strip }.uniq
        score_raw = divs[2].text
                           .split(/:|\(|\)/)
                           .map { |e| e.strip }
                           .select { |e| !e.empty?  }

        kickoff_at = DateTime.parse(divs[0].text)
        home_team = teams_raw[1]
        away_team = teams_raw[3]
        home_score = score_raw[0]
        away_score = score_raw[1]

        Bundesliga::Match.new kickoff_at: kickoff_at,
                              home_team: home_team,
                              away_team: away_team,
                              home_score: home_score,
                              away_score: away_score
      end
    end

    def spieltage
      doc.css('div.spieltage > div.tabele-line')
    end

    def uri
      @uri ||= URI(url)
    end

    def html
      @html ||= Net::HTTP.get(uri)
    end

    def doc
      @doc ||= Nokogiri::HTML(html)
    end
  end # -- class MatchDayParser
end # -- module Bundesliga
