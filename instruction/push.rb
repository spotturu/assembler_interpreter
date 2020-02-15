require './parse_error.rb'

module AssemblerInterpreter
  module Instruction
    class Push
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
        @stack.push(registers[@values[0].key])
      end

      private

      def initialize(values, stack)
        @stack = stack
        @values = values
      end
    end
  end
end