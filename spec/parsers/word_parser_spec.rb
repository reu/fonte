require "spec_helper"

module Fonte
  module Parsers
    describe WordParser do
      let(:parser) { described_class.new }

      subject { parser.parse(word) }

      context "with a string surrounded by double quotes" do
        let(:word) { '"Double quotes yay"' }
        it { should be }
        its(:value) { should == "Double quotes yay" }
      end
    end
  end
end
