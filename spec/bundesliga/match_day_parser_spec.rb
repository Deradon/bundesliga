require 'spec_helper'

describe Bundesliga::MatchDayParser do
  let(:url) { 'http://www.bundesliga.de/de/liga/matches/2014/?md=1' }
  let(:match_day_parser) { described_class.new(url: url) }
  subject { match_day_parser }

  describe ".new" do
    context "without arguments" do
      specify { expect { described_class.new }.to raise_error }
    end
  end

  its(:url) { should eq(url) }
  its(:uri) { should be_kind_of(URI)  }
  its(:html) { should be_kind_of(String)  }
  its(:doc) { should be_kind_of(Nokogiri::HTML::Document) }
  its(:spieltage) { should be_kind_of(Nokogiri::XML::NodeSet) }

  describe "#matches" do
    subject { match_day_parser.matches }

    specify { subject.should be_kind_of(Array) }

    describe "#elements" do
      subject { match_day_parser.matches.first }

      specify { subject.should be_kind_of(Bundesliga::Match) }
    end
  end
end # -- descibed_class Bundesliga::MatchDayParser
