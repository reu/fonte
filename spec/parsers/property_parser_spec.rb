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
          its(:"nickname.value") { should == "Reu" }
        end
      end
    end
  end
end
