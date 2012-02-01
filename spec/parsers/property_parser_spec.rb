require "spec_helper"

module Fonte
  module Parsers
    describe PropertyParser do
      let(:parser) { described_class.new }

      subject { parser.parse(properties) }

      context "with one property" do
        let(:properties) { '(key "value")' }
        it { should be }
        its(:value) { should == { "key" => "value" } }
      end

      context "with multiple properties" do
        let(:properties) { '(key1 "value1") (key2 "value2")' }
        it { should be }
        its(:value) { should == { "key1" => "value1", "key2" => "value2" } }
      end

      context "with properties without values" do
        let(:properties) { '(headshot)' }
        it { should be }
        its(:value) { should == { "headshot" => true } }
      end

      context "player property" do
        let(:properties) { '(player "Reu<2><STEAM_1:1:24968171><Red>")' }
        it { should be }

        describe "player" do
          subject { parser.parse(properties).value["player"] }
          it_should_behave_like "a real player"
        end
      end

      context "number property" do
        let(:properties) { '(area "10")' }
        its(:value) { should == { "area" => 10 } }
      end

      context "coordinate property" do
        let(:properties) { '(attacker_position "-1624 1258 617")' }
        its(:value) { should == { "attacker_position" => [-1624, 1258, 617] } }
      end
    end
  end
end
