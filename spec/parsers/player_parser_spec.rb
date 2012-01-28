require "spec_helper"

module Fonte
  module Parsers
    describe PlayerParser do
      let(:parser) { described_class.new }
      subject { parser.parse(player) }

      context "when the player is a default source player" do
        let(:player) { "Reu<2><STEAM_1:1:24968171><Red>" }
        it { should be }
      end

      context "when the player is a left4dead2 player" do
        let(:player) { "Pulo_ms<8><STEAM_1:1:41920953><Survivor><Producer><ALIVE><100+0><setpos_exact 3617.36 -1739.69 294.53; setang 0.00 179.84 0.00><Area 205>" }
        it { should be }
      end
    end
  end
end
