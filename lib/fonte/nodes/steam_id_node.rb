module Fonte
  module Nodes
    class SteamIDNode < Treetop::Runtime::SyntaxNode
      def value
        text_value
      end

      def valid?
        !invalid? && !bot? && !pending?
      end

      def invalid?
        false
      end

      def bot?
        false
      end

      def pending?
        false
      end
    end
  end
end
