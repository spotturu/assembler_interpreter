module AssemblerInterpreter
  module Value
    class RegisterReference
      def initialize(value)
        @value = value
      end

      def key
        @value
      end

      def value(registers)
        registers[@value]
      end
    end
  end
end
