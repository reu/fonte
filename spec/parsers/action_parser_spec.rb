require "spec_helper"

module Fonte
  module Parsers
    describe ActionParser do
      let(:parser) { described_class.new }

      subject { parser.parse(action) }

      describe "connection" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><>" connected, address "187.123.17.180:27005"' }
        its(:value) { should == "connection" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><>" }
      end

      describe "validation" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><>" STEAM USERID validated' }
        its(:value) { should == "validation" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><>" }
      end

      describe "enter game" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><>" entered the game' }
        its(:value) { should == "enter" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><>" }
      end

      describe "disconnection" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><>" disconnected' }
        its(:value) { should == "disconnection" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><>" }

        context "with properties" do
          let(:action) { '"Reu<2><STEAM_1:1:24968171><>" disconnected (reason "Disconnect by user.")' }
          it_should_behave_like "a action with properties", "reason"
        end
      end

      describe "kick" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><>" was kicked by "Console"' }
        its(:value) { should == "kick" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><>" }

        context "with properties" do
          let(:action) { '"Reu<2><STEAM_1:1:24968171><>" was kicked by "Console" (reason "Disconnect by user.")' }
          it_should_behave_like "a action with properties", "reason"
        end
      end

      describe "kick and ban" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><>" was kicked and banned by "Console"' }
        its(:value) { should == "kickban" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><>" }

        context "with properties" do
          let(:action) { '"Reu<2><STEAM_1:1:24968171><>" was kicked and banned by "Console" (reason "Disconnect by user.")' }
          it_should_behave_like "a action with properties", "reason"
        end
      end

      describe "suicide" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><>" committed suicide with "weapon"' }
        its(:value) { should == "suicide" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><>" }
        its(:"weapon.value") { should == "weapon" }

        context "with properties" do
          let(:action) { '"Reu<2><STEAM_1:1:24968171><>" committed suicide with "weapon" (attacker_position "-3361 1361 -864")' }
          it_should_behave_like "a action with properties", "attacker_position"
        end
      end

      describe "join team" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><>" joined team "Spectator"' }
        its(:value) { should == "join" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><>" }
        its(:"team.value") { should == "Spectator" }
      end

      describe "role selection" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" changed role to "spy"' }
        its(:value) { should == "role selection" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><Blue>" }
        its(:"role.value") { should == "spy" }
      end

      describe "name change" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" changed name to "Navarro"' }
        its(:value) { should == "name change" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><Blue>" }
        its(:"new_name.value") { should == "Navarro" }
      end

      describe "kill" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" killed "guimello<13><STEAM_1:1:34492580><Red>" with "minigun"' }
        its(:value) { should == "kill" }
        its(:"attacker.value") { should == "Reu<2><STEAM_1:1:24968171><Blue>" }
        its(:"victim.value") { should == "guimello<13><STEAM_1:1:34492580><Red>" }

        context "with properties" do
          let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" killed "guimello<13><STEAM_1:1:34492580><Red>" with "minigun" (attacker_position "3354 -2485 -187") (victim_position "3410 -2518 -149")' }
          it_should_behave_like "a action with properties", "attacker_position", "victim_position"
        end
      end

      describe "injure" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" attacked "guimello<13><STEAM_1:1:34492580><Red>" with "minigun"' }
        its(:value) { should == "injure" }
        its(:"attacker.value") { should == "Reu<2><STEAM_1:1:24968171><Blue>" }
        its(:"victim.value") { should == "guimello<13><STEAM_1:1:34492580><Red>" }

        context "with properties" do
          let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" attacked "guimello<13><STEAM_1:1:34492580><Red>" with "minigun" (attacker_position "3354 -2485 -187") (victim_position "3410 -2518 -149")' }
          it_should_behave_like "a action with properties", "attacker_position", "victim_position"
        end
      end

      describe "action trigger against player" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" triggered "player_extinguished" against "guimello<13><STEAM_1:1:34492580><Red>"' }
        its(:value) { should == "player_extinguished" }
        its(:"attacker.value") { should == "Reu<2><STEAM_1:1:24968171><Blue>" }
        its(:"victim.value") { should == "guimello<13><STEAM_1:1:34492580><Red>" }

        context "with extra arguments" do
          let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" triggered "player_extinguished" against "guimello<13><STEAM_1:1:34492580><Red>"' }
          its(:value) { should == "player_extinguished" }
          its(:"attacker.value") { should == "Reu<2><STEAM_1:1:24968171><Blue>" }
          its(:"victim.value") { should == "guimello<13><STEAM_1:1:34492580><Red>" }
        end

        context "with properties" do
          let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" triggered "player_extinguished" against "guimello<13><STEAM_1:1:34492580><Red>" (attacker_position "3354 -2485 -187") (victim_position "3410 -2518 -149")' }
          it_should_behave_like "a action with properties", "attacker_position", "victim_position"
          its(:value) { should == "player_extinguished" }
          its(:"attacker.value") { should == "Reu<2><STEAM_1:1:24968171><Blue>" }
          its(:"victim.value") { should == "guimello<13><STEAM_1:1:34492580><Red>" }
        end

        context "with properties and extra arguments" do
          let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" triggered "player_extinguished" against "guimello<13><STEAM_1:1:34492580><Red>" with "tf_weapon_medigun" (attacker_position "3354 -2485 -187") (victim_position "3410 -2518 -149")' }
          it_should_behave_like "a action with properties", "attacker_position", "victim_position"
          its(:value) { should == "player_extinguished" }
          its(:"attacker.value") { should == "Reu<2><STEAM_1:1:24968171><Blue>" }
          its(:"victim.value") { should == "guimello<13><STEAM_1:1:34492580><Red>" }
        end
      end

      describe "player action" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" triggered "builtobject"' }
        its(:value) { should == "builtobject" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><Blue>" }

        context "with properties" do
          let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" triggered "builtobject" (attacker_position "3354 -2485 -187") (victim_position "3410 -2518 -149")' }
          it_should_behave_like "a action with properties", "attacker_position", "victim_position"
        end
      end

      describe "team action" do
        let(:action) { 'Team "Red" triggered "capture"' }
        its(:value) { should == "capture" }
        its(:"team.value") { should == "Red" }
      end

      describe "world action" do
        let(:action) { 'World triggered "Round_Start"' }
        its(:value) { should == "Round_Start" }

        context "with properties" do
          let(:action) { 'World triggered "Mini_Round_Selected" (round "Round_A")' }
          it_should_behave_like "a action with properties", "round"
        end
      end

      describe "chat" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" say "hai"' }
        its(:value) { should == "chat" }
        its(:"message.value") { should == "hai" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><Blue>" }
      end

      describe "team chat" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" say_team "hai"' }
        its(:value) { should == "team chat" }
        its(:"message.value") { should == "hai" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><Blue>" }
      end

      describe "private chat" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" tell "guimello<13><STEAM_1:1:34492580><Blue>" message "gogogo"' }
        its(:value) { should == "private chat" }
        its(:"message.value") { should == "gogogo" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><Blue>" }
        its(:"target.value") { should == "guimello<13><STEAM_1:1:34492580><Blue>" }
      end

      describe "team alliance" do
        let(:action) { 'Team "Red" formed alliance with team "Blue"' }
        its(:value) { should == "alliance" }
        its(:"team.value") { should == "Red" }
        its(:"allied_team.value") { should == "Blue" }
      end

      describe "score report" do
        let(:action) { 'Team "Red" scored "3" with "12" players' }
        its(:value) { should == "team score" }
        its(:"team.value") { should == "Red" }
        its(:"points.value") { should == 3 }
        its(:"players_count.value") { should == 12 }
      end

      describe "weapon selection" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" selected weapon "AWP"' }
        its(:value) { should == "weapon selection" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><Blue>" }
        its(:"weapon.value") { should == "AWP" }
      end

      describe "weapon pickup" do
        let(:action) { '"Reu<2><STEAM_1:1:24968171><Blue>" acquired weapon "Shotgun"' }
        its(:value) { should == "weapon pickup" }
        its(:"player.value") { should == "Reu<2><STEAM_1:1:24968171><Blue>" }
        its(:"weapon.value") { should == "Shotgun" }
      end
    end
  end
end
