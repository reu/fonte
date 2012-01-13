module Fonte
  module Nodes
    class IntegerNode < Treetop::Runtime::SyntaxNode
      def value
        Integer(text_value)
      end
    end
  end
end
