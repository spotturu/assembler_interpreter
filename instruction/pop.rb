require './parse_error.rb'

module AssemblerInterpreter
  module Instruction
    class Pop
      def self.build(params, registers, stack)
        begin
          raise ParseError.new "Invalid register #{params}" if params.length != 1
          raise ParseError.new "#{register} is not defined" unless registers.keys.include?(params.first)
          values = params.map { |param| Value.decorate(param, registers) }

          new(values, stack)
        rescue ParseError => e
           return "ERROR: #{e.message}"
        end
      end

      def execute(registers)
          registers[@values[0].key] = @stack.pop()
      end

      private

      def initialize(values, stack)
        @values = values
        @stack = stack
      end
    end
  end
end