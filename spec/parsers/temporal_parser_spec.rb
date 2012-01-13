require "spec_helper"

module Fonte
  module Parsers
    describe TemporalParser do
      let(:parser) { described_class.new }

      subject { parser.parse(date_time) }

      context "with a valid format" do
        let(:date_time) { "12/26/2011 - 02:14:29" }
        it { should be }

        subject { parser.parse(date_time).value }

        its(:day)   { should == 26 }
        its(:month) { should == 12 }
        its(:year)  { should == 2011 }
        its(:hour)  { should == 2 }
        its(:min)   { should == 14 }
        its(:sec)   { should == 29 }
      end

      context "with a invalid format" do
        let(:date_time) { "12/26/2011 02:14:29" }
        it { should_not be }
      end
    end
  end
end

