require "spec_helper"

module Fonte
  module Parsers
    describe RconParser do
      let(:parser) { described_class.new }

      subject { parser.parse(rcon_command) }

      context "with a successfully rcon challenge" do
        let(:rcon_command) { 'Rcon: "rcon challenge "password" command" from "192.168.10.1:17015"' }
        it { should be }
      end

      context "with a bad rcon challenge" do
        let(:rcon_command) { 'Bad Rcon: "rcon challenge "password" command" from "192.168.10.1:17015"' }
        it { should be }
      end
    end
  end
end
