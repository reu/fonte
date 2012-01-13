require "spec_helper"

module Fonte
  module Parsers
    describe SteamIDParser do
      let(:parser) { described_class.new }

      subject { parser.parse(steam_id) }

      describe "value" do
        subject { parser.parse(steam_id).value }

        context "of a validated user" do
          let(:steam_id) { "STEAM_1:1:24968171" }

          it "is the string representation of the steam id itself" do
            should == steam_id
          end
        end

        context "of a pending approve user" do
          let(:steam_id) { "STEAM_ID_PENDING" }
          it { should_not be }
        end

        context "of a bot" do
          let(:steam_id) { "Bot" }
          it { should_not be }
        end

        context "of a invalid user" do
          let(:steam_id) { "UNKNOWN" }
          it { should_not be }
        end
      end

      describe "universe" do
        subject { parser.parse(steam_id).universe }

        context "STEAM_0" do
          let(:steam_id) { "STEAM_0:1:24968171" }

          it { should be_unspecified }
          its(:value) { should == "Unspecified" }
        end

        context "STEAM_1" do
          let(:steam_id) { "STEAM_1:1:24968171" }

          it { should be_public }
          its(:value) { should == "Public" }
        end

        context "STEAM_2" do
          let(:steam_id) { "STEAM_2:1:24968171" }

          it { should be_beta }
          its(:value) { should == "Beta" }
        end

        context "STEAM_3" do
          let(:steam_id) { "STEAM_3:1:24968171" }

          it { should be_internal }
          its(:value) { should == "Internal" }
        end

        context "STEAM_4" do
          let(:steam_id) { "STEAM_4:1:24968171" }

          it { should be_developer }
          its(:value) { should == "Dev" }
        end

        context "STEAM_5" do
          let(:steam_id) { "STEAM_5:1:24968171" }

          it { should be_rc }
          its(:value) { should == "RC" }
        end
      end

      describe "id_part" do
        subject { parser.parse(steam_id).id_part }

        context "when 0" do
          let(:steam_id) { "STEAM_0:0:24968171" }
          its(:value) { should == 0 }
        end

        context "when 1" do
          let(:steam_id) { "STEAM_0:1:24968171" }
          its(:value) { should == 1 }
        end

        context "when not 0 nor 1" do
          let(:steam_id) { "STEAM_0:3:24968171" }

          subject { parser.parse(steam_id) }
          it { should_not be }
        end
      end

      describe "account_number" do
        subject { parser.parse(steam_id).account_number }

        let(:steam_id) { "STEAM_0:0:24968171" }
        its(:value) { should == 24968171 }
      end
    end
  end
end
