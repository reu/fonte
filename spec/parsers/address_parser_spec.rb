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
        its(:"port.value") { should == 3000 }
      end

      context "with a missing octet" do
        let(:ip) { "192.10.1" }
        it { should_not be }
      end

      context "first octet with more than 8 bits" do
        let(:ip) { "1929.10.1.1" }
        it { should_not be }
      end

      context "second octet with more than 8 bits" do
        let(:ip) { "192.1110.1.1" }
        it { should_not be }
      end

      context "first octet with more than 8 bits" do
        let(:ip) { "192.10.1212.1" }
        it { should_not be }
      end

      context "first octet with more than 8 bits" do
        let(:ip) { "192.10.1.1123" }
        it { should_not be }
      end
    end
  end
end
