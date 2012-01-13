module Fonte
  module Nodes
    class BotSteamIDNode < BlankSteamIDNode
      def bot?
        true
      end
    end
  end
end
