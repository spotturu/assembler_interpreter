require './parse_error.rb'

module AssemblerInterpreter
  module Instruction
    class Mul
      def self.build(params, registers)
        begin
          raise ParseError.new "Invalid params #{params}" if params.length != 2

          values = params.map { |param| Value.decorate(param, registers) }

          new(values)
        rescue ParseError => e
           return "ERROR: #{e.message}"
        end
      end

      def execute(registers)
        product = @values.map { |v| v.value(registers) }.reduce(&:*)

        registers[@values[0].key] = product
      end

      private

      def initialize(values)
        @values = values
      end
    end
  end
end
