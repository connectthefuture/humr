require 'term/ansicolor'

module Humr
  class Handler
    @@handlers = {}

    def name
      self.class.instance_eval { @name }
    end

    def self.register(name)
      @@handlers[name] = self
      @name = name
    end

    def self.[](name)
      @@handlers[name]
    end

    def colorize(s)
      Term::ANSIColor.send(color, s)
    end

    def format(s)
      replace(s) { |s| colorize(s) }
    end
  end
end