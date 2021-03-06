require "spec_helper"

module Fonte
  module Parsers
    describe SteamIDParser do
      let(:parser) { described_class.new }

      subject { parser.parse(steam_id) }

      describe "node" do
        subject { parser.parse(steam_id) }

        context "of a validated user" do
          let(:steam_id) { "STEAM_1:1:24968171" }
          its(:value) { should == steam_id }

          it { should be_real_player }
          it { should_not be_bot }
          it { should_not be_unknown }
          it { should_not be_pending }
          it { should_not be_console }
        end

        context "of a pending user" do
          let(:steam_id) { "STEAM_ID_PENDING" }
          its(:value) { should_not be }

          it { should_not be_real_player }
          it { should_not be_unknown }
          it { should_not be_bot }
          it { should be_pending }
          it { should_not be_console }
        end

        context "of a bot" do
          context "labeled as Bot" do
            let(:steam_id) { "Bot" }
            its(:value) { should_not be }

            it { should_not be_real_player }
            it { should_not be_unknown }
            it { should be_bot }
            it { should_not be_pending }
            it { should_not be_console }
          end

          context "labeled as BOT" do
            let(:steam_id) { "BOT" }
            its(:value) { should_not be }

            it { should_not be_real_player }
            it { should_not be_unknown }
            it { should be_bot }
            it { should_not be_pending }
            it { should_not be_console }
          end
        end

        context "of a invalid user" do
          let(:steam_id) { "UNKNOWN" }
          its(:value) { should_not be }

          it { should_not be_real_player }
          it { should be_unknown }
          it { should_not be_bot }
          it { should_not be_pending }
          it { should_not be_console }
        end

        context "of the console user" do
          let(:steam_id) { "Console" }
          its(:value) { should_not be }

          it { should_not be_real_player }
          it { should_not be_unknown }
          it { should_not be_bot }
          it { should_not be_pending }
          it { should be_console }
        end
      end

      describe "universe" do
        subject { parser.parse(steam_id).universe }

        context "STEAM_0" do
          let(:steam_id) { "STEAM_0:1:24968171" }

          it { should be_unspecified }
          it { should_not be_public }
          it { should_not be_beta }
          it { should_not be_internal }
          it { should_not be_developer }
          it { should_not be_rc }
          its(:value) { should == "Unspecified" }
        end

        context "STEAM_1" do
          let(:steam_id) { "STEAM_1:1:24968171" }

          it { should be_public }
          it { should_not be_unspecified }
          it { should_not be_beta }
          it { should_not be_internal }
          it { should_not be_developer }
          it { should_not be_rc }
          its(:value) { should == "Public" }
        end

        context "STEAM_2" do
          let(:steam_id) { "STEAM_2:1:24968171" }

          it { should be_beta }
          it { should_not be_unspecified }
          it { should_not be_public }
          it { should_not be_internal }
          it { should_not be_developer }
          it { should_not be_rc }
          its(:value) { should == "Beta" }
        end

        context "STEAM_3" do
          let(:steam_id) { "STEAM_3:1:24968171" }

          it { should be_internal }
          it { should_not be_unspecified }
          it { should_not be_public }
          it { should_not be_beta }
          it { should_not be_developer }
          it { should_not be_rc }
          its(:value) { should == "Internal" }
        end

        context "STEAM_4" do
          let(:steam_id) { "STEAM_4:1:24968171" }

          it { should be_developer }
          it { should_not be_unspecified }
          it { should_not be_public }
          it { should_not be_beta }
          it { should_not be_internal }
          it { should_not be_rc }
          its(:value) { should == "Dev" }
        end

        context "STEAM_5" do
          let(:steam_id) { "STEAM_5:1:24968171" }

          it { should be_rc }
          it { should_not be_unspecified }
          it { should_not be_public }
          it { should_not be_beta }
          it { should_not be_internal }
          it { should_not be_developer }
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

      describe "community_id" do
        subject { parser.parse(steam_id).community_id }

        context "with a steam_id that represents a user" do
          let(:steam_id) { "STEAM_1:1:24968171" }
          it { should == 76561198010202071 }
        end

        context "with a steam_id that doesn't represent a user" do
          let(:steam_id) { "STEAM_ID_PENDING" }
          it { should be_nil }
        end
      end
    end
  end
end
