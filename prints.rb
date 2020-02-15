module AssemblerInterpreter
  module Prints
    def self.statement(prints_list, registers)
      prints_list.each do |ele|
        puts 'Output data'
        if ele.length == 2
          puts registers[ele]
        else
          puts ele
        end
        puts ''
      end
    end
  end
end