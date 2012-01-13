module Fonte
  module Nodes
    class IpNode < Treetop::Runtime::SyntaxNode
      def value
        URI.parse("//" + text_value)
      end
    end
  end
end
