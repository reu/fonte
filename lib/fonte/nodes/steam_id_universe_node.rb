module Fonte
  module Nodes
    class SteamIDUniverseNode < Treetop::Runtime::SyntaxNode
      def value
        case universe.text_value.to_i
          when 0
            "Unspecified"
          when 1
            "Public"
          when 2
            "Beta"
          when 3
            "Internal"
          when 4
            "Dev"
          when 5
            "RC"
          end
      end

      def unspecified?
        value == "Unspecified"
      end

      def public?
        value == "Public"
      end

      def beta?
        value == "Beta"
      end

      def internal?
        value == "Internal"
      end

      def developer?
        value == "Dev"
      end

      def rc?
        value == "RC"
      end
    end
  end
end
