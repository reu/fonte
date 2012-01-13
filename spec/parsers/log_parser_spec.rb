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
        describe "log started command" do
          let(:text) { 'L 12/26/2011 - 02:14:29: Log file started (file "logs/L127_000_001_001_27015_201112260214_000.log") (game "/home/ubuntu/srcds/left4dead2/left4dead2") (version "4777")' }
          it { should be }

          let(:command) { parser.parse(text).command }

          describe "log filename" do
            subject { command.log_filename.value }
            it { should == "logs/L127_000_001_001_27015_201112260214_000.log" }
          end

          describe "game path" do
            subject { command.log_game_path.value }
            it { should == "/home/ubuntu/srcds/left4dead2/left4dead2" }
          end

          describe "game version" do
            subject { command.log_game_version.value }
            it { should == "4777" }
          end
        end

        describe "map loading command" do
          let(:text) { 'L 12/26/2011 - 02:14:29: Loading map "c4m2_sugarmill_a"' }
          it { should be }

          let(:command) { parser.parse(text).command }

          describe "map name" do
            subject { command.map_name.value }
            it { should == "c4m2_sugarmill_a" }
          end
        end

        describe "map started command" do
          let(:text) { 'L 12/26/2011 - 02:14:33: Started map "c4m2_sugarmill_a" (CRC "-431283537")' }
          it { should be }

          let(:command) { parser.parse(text).command }

          describe "map name" do
            subject { command.map_name.value }
            it { should == "c4m2_sugarmill_a" }
          end

          describe "map CRC" do
            subject { command.map_crc.value }
            it { should == "-431283537" }
          end
        end

        describe "map started command" do
          let(:text) { 'L 12/26/2011 - 02:14:33: Started map "c4m2_sugarmill_a" (CRC "-431283537")' }
          it { should be }

          let(:command) { parser.parse(text).command }

          describe "map name" do
            subject { command.map_name.value }
            it { should == "c4m2_sugarmill_a" }
          end

          describe "map CRC" do
            subject { command.map_crc.value }
            it { should == "-431283537" }
          end
        end

        describe "sever name command" do
          let(:text) { 'L 12/26/2011 - 02:14:33: Server name is "Manapot Server"' }
          it { should be }

          let(:command) { parser.parse(text).command }

          describe "server name" do
            subject { command.server_name.value }
            it { should == "Manapot Server" }
          end
        end

        describe "sever say command" do
          let(:text) { 'L 12/26/2011 - 02:14:33: Server say "Hai"' }
          it { should be }

          let(:command) { parser.parse(text).command }

          describe "server say" do
            subject { command.server_say.value }
            it { should == "Hai" }
          end
        end

        describe "rcon command" do
          let(:text) { 'L 12/26/2011 - 02:14:33: Rcon: "rcon challenge "password" command" from "192.168.10.1:17015"' }
          subject { parser.parse(text).command }
          it_should_behave_like "a rcon command", :password => "password", :origin => "//192.168.10.1:17015"
        end
      end
    end
  end
end
