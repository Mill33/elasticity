module Elasticity

  class BootstrapAction

    attr_accessor :name
    attr_accessor :option
    attr_accessor :value
    attr_accessor :script

    def initialize(script, option, value)
      @name = 'Elasticity Bootstrap Action'
      @option = option
      @value = value
      @script = script
    end

    def to_aws_bootstrap_action
      action = {
        :name => @name,
        :script_bootstrap_action => {
          :path => @script
        }
      }

      if @option || @value
        if @value
          action[:script_bootstrap_action][:args] = [@option, @value]
        else
          action[:script_bootstrap_action][:args] = [@option]
        end
      end

      action
    end

  end

end