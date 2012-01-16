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
      end

      describe "commands" do
        describe "rcon command" do
          let(:text) { 'L 12/26/2011 - 02:14:33: Rcon: "rcon challenge "password" command" from "192.168.10.1:17015"' }
          subject { parser.parse(text).command }
          it_should_behave_like "a rcon command", :password => "password", :origin => "//192.168.10.1:17015"
        end
      end
    end
  end
end
