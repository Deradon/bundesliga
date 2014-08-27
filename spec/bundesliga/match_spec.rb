require 'spec_helper'

describe Bundesliga::Match do
  let(:kickoff_at) { Time.new(2014, 07, 14, 12) }
  let(:home_team) { "Team One" }
  let(:away_team) { "Team Two" }

  subject do
    described_class.new(kickoff_at: kickoff_at,
                        home_team: home_team,
                        away_team: away_team,
                        home_score: 2,
                        away_score: 1)
  end


  its(:kickoff_at) { should eq(kickoff_at) }
  its(:home_team) { should eq(home_team) }
  its(:away_team) { should eq(away_team) }
  its(:home_score) { should eq(2) }
  its(:away_score) { should eq(1) }
end # -- describe Bundesliga::Match
