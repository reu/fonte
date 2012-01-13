module Fonte
  module Nodes
    class RconCommandNode < Treetop::Runtime::SyntaxNode
      def password
        rcon_challenge.rcon_password
      end

      def origin
        rcon_challenge.rcon_origin
      end
    end
  end
end
