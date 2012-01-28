module Fonte
  module Parsers
    %w(number word temporal address rcon steam_id source_player l4d2_player player property action log).each do |parser|
      Treetop.load File.join(File.dirname(__FILE__), "parsers", parser)
    end
  end
end
