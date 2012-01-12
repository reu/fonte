require "spec_helper"

module Fonte
  module Parsers
    describe AddressParser do
      let(:parser) { described_class.new }

      subject { parser.parse(ip) }

      context "with a valid ip number" do
        let(:ip) { "192.168.10.1" }
        it { should be }
      end

      context "with a valid ip number and port" do
        let(:ip) { "192.168.10.1:3000" }
        it { should be }
      end

      context "with a invalid ip number" do
        let(:ip) { "192.10.1" }
        it { should_not be }
      end
    end
  end
end
