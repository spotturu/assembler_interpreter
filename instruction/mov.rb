
require './parse_error.rb'
require 'bigdecimal'

module AssemblerInterpreter
  module Instruction
    class Mov
      def self.build(params, registers)
         begin
            raise ParseError.new "Invalid params #{params}" if params.length != 2

            register, value = *params

            raise ParseError.new "#{register} is not defined" unless registers.keys.include?(register)
            raise ParseError.new "#{value} is not a number" unless value =~ /\d+/

            new(register, BigDecimal(value).to_f)
         rescue ParseError => e
           return "ERROR: #{e.message}"
         end

      end

      def execute(registers)
        registers[@register] = @value
      end

      private

      def initialize(register, value)
        @register = register
        @value = value
      end
    end
  end
end
