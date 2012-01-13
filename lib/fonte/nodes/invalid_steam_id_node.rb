module Fonte
  module Nodes
    class InvalidSteamIDNode < BlankSteamIDNode
      def invalid?
        true
      end
    end
  end
end
