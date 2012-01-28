require "spec_helper"

module Fonte
  module Parsers
    describe L4D2PlayerParser do
      let(:parser) { described_class.new }
      let(:player) { "Pulo_ms<8><STEAM_1:1:41920953><Survivor><Producer><ALIVE><100+0><setpos_exact 3617.36 -1739.69 294.53; setang 0.00 179.84 0.00><Area 205>" }

      subject { parser.parse(player) }

      it_should_behave_like "a real player"

      its(:value) { should == "Pulo_ms<8><STEAM_1:1:41920953><Survivor>" }

      its(:"nickname.value")  { should == "Pulo_ms" }
      its(:"uid.value")       { should == 8 }
      its(:"steam_id.value")  { should == "STEAM_1:1:41920953" }
      its(:"team.value")      { should == "Survivor" }
      its(:"character.value") { should == "Producer" }
      its(:"status.value")    { should == "ALIVE" }
      its(:"life.value")      { should == 100 }
      its(:"blood.value")     { should == 0 }
      its(:"position.value")  { should == [3617.36, -1739.69, 294.53] }
      its(:"angle.value")     { should == [0.00, 179.84, 0.00] }
      its(:"area.value")      { should == 205 }
    end
  end
end
