module Fonte
  module Nodes
    class SteamIDNode < Treetop::Runtime::SyntaxNode
      def value
        nil
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
