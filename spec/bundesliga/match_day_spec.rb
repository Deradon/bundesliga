require 'spec_helper'

describe Bundesliga::MatchDay do
  let(:match_day) { described_class.new(year: 2014) }
  let(:current_year) { Time.now.year }

  describe ".new" do
    context "when given no arguments" do
      subject { described_class.new }
      its(:year) { should eq(current_year) }
      its(:day) { should eq(1) }
    end

    context "when given 2013 as year" do
      subject { described_class.new(year: 2013) }
      its(:year) { should eq(2013) }
    end

    context "when given 18 as day" do
      subject { described_class.new(day: 18) }
      its(:day) { should eq(18) }
    end
  end

  describe "#matches" do
    subject { match_day.matches }

    specify { expect(subject).to be_kind_of(Array) }
    its(:length) { should eq(9) } # 9 matches played this MatchDay
  end
end # -- describe Bundesliga::MatchDay
