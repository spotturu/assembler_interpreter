module AssemblerInterpreter
  module Value
    def self.decorate(value, registers)
      if numeric?(value)
        Numeric.new(value.to_i)
      elsif registers.keys.include?(value)
        RegisterReference.new(value)
      else
        raise ParseError
      end
    end
    
    def self.numeric?(value)
      value =~ /\d+/
    end
  end
end