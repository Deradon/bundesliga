module Bundesliga
  class Match
    attr_reader :kickoff_at
    attr_reader :home_team, :home_score
    attr_reader :away_team, :away_score

    def initialize(kickoff_at: kickoff_at,
                   home_team: home_team,
                   away_team: away_team,
                   home_score: home_score,
                   away_score: away_score)
      @kickoff_at = kickoff_at
      @home_team = home_team
      @away_team = away_team
      @home_score = home_score
      @away_score = away_score
    end
  end # -- Match
end # -- Bundesliga
