require "spec_helper"

module Fonte
  module Parsers
    describe LogParser do
      let(:parser) { described_class.new }

      subject { parser.parse(text) }

      describe "entry" do
        let(:text) { 'L 12/26/2011 - 02:14:29: Loading map "c4m2_sugarmill_a"' }
        it { should be }

        describe "time" do
          subject { parser.parse(text).date_time }
          it { should be }
        end

        describe "command" do
          subject { parser.parse(text).command }
          it { should be }
        end

        context "when there are garbage before the log line" do
          let(:text) { '????RL 12/26/2011 - 02:14:29: Loading map "c4m2_sugarmill_a"' }
          it { should be }
        end

        context "when there is a line break after the log line" do
          let(:text) { "L 12/26/2011 - 02:14:29: server cvars start\n" }
          it { should be }
        end
      end
    end
  end
end
