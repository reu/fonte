module Fonte
  module Nodes
    class SingleWordNode < Treetop::Runtime::SyntaxNode
      def value
        quoted_word.value
      end
    end
  end
end
