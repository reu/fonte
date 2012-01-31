require "spec_helper"

module Fonte
  module Parsers
    describe L4D2PlayerParser do
      subject { parser.parse(player) }
      let(:parser) { described_class.new }

      context "of a real player" do
        let(:player) { "Pulo_ms<8><STEAM_1:1:41920953><Survivor><Producer><ALIVE><100+0><setpos_exact 3617.36 -1739.69 294.53; setang 0.00 179.84 0.00><Area 205>" }

        it_should_behave_like "a real player"

        its(:value) { should == "Pulo_ms<8><STEAM_1:1:41920953><Survivor>" }

        its(:"nickname.value")  { should == "Pulo_ms" }
        its(:"uid.value")       { should == 8 }
        its(:"steam_id.value")  { should == "STEAM_1:1:41920953" }
        its(:"team.value")      { should == "Survivor" }
        its(:"character.value") { should == "Producer" }
        its(:"status.value")    { should == "ALIVE" }
        its(:life)              { should == 100 }
        its(:blood)             { should == 0 }
        its(:"position.value")  { should == [3617.36, -1739.69, 294.53] }
        its(:"angle.value")     { should == [0.00, 179.84, 0.00] }
        its(:"area.value")      { should == 205 }
      end

      context "of a infected" do
        let(:player) { "infected<552><><Infected><infected><DEAD><100+50><setpos_exact 4831.17 -3989.32 104.81; setang 0.00 288.65 0.00><Area 792>" }

        its(:value) { should == "infected<552><><Infected>" }

        its(:"nickname.value")  { should == "infected" }
        its(:"uid.value")       { should == 552 }
        its(:"steam_id.value")  { should be_nil }
        its(:"team.value")      { should == "Infected" }
        its(:"character.value") { should == "infected" }
        its(:"status.value")    { should == "DEAD" }
        its(:life)              { should == 100 }
        its(:blood)             { should == 50 }
        its(:"position.value")  { should == [4831.17, -3989.32, 104.81] }
        its(:"angle.value")     { should == [0.00, 288.65, 0.00] }
        its(:"area.value")      { should == 792 }
      end

      context "with zero life" do
        let(:player) { "infected<552><><Infected><infected><DEAD><0><setpos_exact 4831.17 -3989.32 104.81; setang 0.00 288.65 0.00><Area 792>" }

        its(:life)  { should == 0 }
        its(:blood) { should == 0 }
      end
    end
  end
end
