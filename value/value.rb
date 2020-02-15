module AssemblerInterpreter
  module Value
    class Numeric
      def initialize(value)
        @value = value
      end

      def value(_registers)
        @value
      end
    end
  end
end