require "spec_helper"

module Fonte
  module Parsers
    describe PlayerParser do
      let(:parser) { described_class.new }
      let(:player) { "Reu<2><STEAM_1:1:24968171><Red>" }

      subject { parser.parse(player) }

      its(:"nickname.value") { should == "Reu" }
      its(:"uid.value")      { should == 2 }
      its(:"steam_id.value") { should == "STEAM_1:1:24968171" }
      its(:"team.value")     { should == "Red" }

      context "when the player is a bot" do
        let(:player) { "Nick<42><Bot><Red>" }
        its(:"steam_id.value") { should be_nil }
      end

      context "when the player is the console" do
        let(:player) { "Console<0><Console><Console>" }
        its(:"steam_id.value") { should be_nil }
        its(:"team.value")     { should be_nil }
      end

      context "when the team is not present" do
        let(:player) { "Reu<2><STEAM_1:1:24968171><>" }
        its(:"team.value") { should be_nil }
      end

      context "when the team is unissiged" do
        let(:player) { "Reu<2><STEAM_1:1:24968171><Unassigned>" }
        its(:"team.value") { should be_nil }
      end
    end
  end
end
