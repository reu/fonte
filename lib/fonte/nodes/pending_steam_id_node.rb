module Fonte
  module Nodes
    class PendingSteamIDNode < BlankSteamIDNode
      def pending?
        true
      end
    end
  end
end
