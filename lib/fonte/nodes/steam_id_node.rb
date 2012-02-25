module Fonte
  module Nodes
    class SteamIDNode < Treetop::Runtime::SyntaxNode
      ID64_IDENTIFIER = 0x0110000100000000

      def value
        nil
      end

      def community_id
        return unless real_player?
        id_part.value + account_number.value * 2 + ID64_IDENTIFIER
      end

      def real_player?
        !unknown? && !bot? && !pending? && !console?
      end

      def unknown?
        false
      end

      def bot?
        false
      end

      def pending?
        false
      end

      def console?
        false
      end
    end
  end
end
