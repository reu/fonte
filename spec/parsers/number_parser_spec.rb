require "spec_helper"

module Fonte
  module Parsers
    describe NumberParser do
      let(:parser) { described_class.new }

      subject { parser.parse(number).value }

      describe "integer" do
        context "decimal" do
          context "positive" do
            let(:number) { "42" }
            it { should == 42 }
          end

          context "negative" do
            let(:number) { "-3" }
            it { should == -3 }
          end
        end

        context "hexadecimal" do
          context "positive" do
            let(:number) { "0xff" }
            it { should == 255 }
          end

          context "negative" do
            let(:number) { "-0XFF" }
            it { should == -255 }
          end
        end

        context "binary" do
          context "positive" do
            let(:number) { "0b110" }
            it { should == 6 }
          end

          context "negative" do
            let(:number) { "-0B110" }
            it { should == -6 }
          end
        end
      end

      describe "floating point" do
        describe "standard notation" do
          context "positive" do
            let(:number) { "10.3"}
            it { should == 10.3 }
          end

          context "negative" do
            let(:number) { "-43.21" }
            it { should == -43.21 }
          end

          context "just decimal points" do
            let(:number) { ".21" }
            it { should == 0.21 }
          end
        end

        describe "scientific notation" do
          context "with positive expoent" do
            let(:number) { "5e4" }
            it { should == 50000.0 }
          end

          context "with negative expoent" do
            let(:number) { "2.2E-4" }
            it { should == 0.00022 }
          end
        end
      end

      describe "coordinates" do
        context "only integers" do
          let(:number) { "10 10 20" }
          it { should == [10, 10, 20] }
        end

        context "only floats" do
          let(:number) { "3617.36 -1739.69 294.53" }
          it { should == [3617.36, -1739.69, 294.53] }
        end

        context "mixing integers and floats" do
          let(:number) { "3617.36 -1739 294.53" }
          it { should == [3617.36, -1739, 294.53] }
        end
      end
    end
  end
end
