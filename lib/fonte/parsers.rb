module Fonte
  module Parsers
    %w(number word temporal address rcon).each do |parser|
      Treetop.load File.join(File.dirname(__FILE__), "parsers", parser)
    end
  end
end
