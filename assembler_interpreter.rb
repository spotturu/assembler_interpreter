require './instruction/mov.rb'
require './instruction/div.rb'
require './instruction/add.rb'
require './instruction/sub.rb'
require './instruction/push.rb'
require './instruction/pop.rb'
require './instruction/mul.rb'
require './instruction/sub.rb'
require './value/value.rb'
require './value/register_reference.rb'
require './value.rb'
require './prints.rb'
require './parse_error.rb'

module AssemblerInterpreter
  def self.execute(code)
    registers = {"ax" => 0, "bx" => 0, "cx" => 0}
    stack = Array.new
    lines = code.compact
    print_statements = Array.new
    lines.each do |line|
      instruction_str, *params = line.split(' ')
      instruction = case instruction_str.upcase
                    when 'MOV'
                      Instruction::Mov.build(params, registers)
                    when 'MUL'
                      Instruction::Mul.build(params, registers)
                    when 'SUB'
                      Instruction::Sub.build(params, registers)
                    when 'DIV'
                      Instruction::Div.build(params, registers)
                    when 'PUSH'
                      Instruction::Push.build(params, registers, stack)
                    when 'POP'
                      Instruction::Pop.build(params, registers, stack)
                    when 'ADD'
                      Instruction::Add.build(params, registers)
                    when 'PRINT'
                      print_statements.push(params.join(' '))
                    else
                      raise ParseError, "Unknown instruction: #{instruction_str}"
                    end
      
        
        if instruction.to_s.start_with?('ERROR')
            puts instruction
            break
        end
        instruction.execute(registers) if instruction_str.upcase != 'PRINT' 
    end
    registers

    Prints::statement(print_statements, registers)
    
  end
    
end

data = Array.new
until (input = gets.chomp) =~ /Calculation complete/i
   data.push(input)
end
data.push(input)
AssemblerInterpreter::execute(data)