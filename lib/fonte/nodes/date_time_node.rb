module Fonte
  module Nodes
    class DateTimeNode < Treetop::Runtime::SyntaxNode
      def value
        DateTime.new date.year.value,
                     date.month.value,
                     date.day.value,
                     time.hours.value,
                     time.minutes.value,
                     time.seconds.value
      end
    end
  end
end
