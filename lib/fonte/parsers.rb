module Fonte
  module Parsers
    %w(number word temporal address rcon log).each do |parser|
      Treetop.load File.join(File.dirname(__FILE__), "parsers", parser)
    end
  end
end
