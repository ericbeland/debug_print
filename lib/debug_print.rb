require "debug_print/version"

# A module to add the helper debug method d to Kernel.

# to configure output:
      # DebugPrint.debug_output do |output|
      #   ::Rails.logger.debug output
      # end

# because this uses binding_of_caller, it should only be used in development

module DebugPrint
    
    @@debug_output_block = nil

    # Set a block to be used for debug output. Call the Rails logger, write to a DB, etc.
      # debug_output do |output|
      #   ::Rails.logger.debug output
      # end
    def self.debug_output(&debug_output_block)
      @@debug_output_block = debug_output_block
    end

    # Output a result via the debug_output configuration, or 
    def self.out(value)
      if @@debug_output_block 
        @@debug_output_block.call value
      else
        puts value
      end
    end

  private
    # Takes an expression (variable, etc.) and evaluates it in the binding of the caller.
    # Then it does a debug printing the variable name, and value
    def d(expression)
      result = binding.of_caller(1).eval(expression.to_s)
      inspection = result.inspect
      if result.inspect.length < 50
        sout = "\t<#{result.class.name}> #{expression} = #{inspection}" 
      else
        sout  = "\n<#{result.class.name}> #{expression} =\n"
        sout += inspection + "\n\n" 
      end
      DebugPrint.out(sout)
    end

end

class Object
  include DebugPrint
end