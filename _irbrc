# vim: set filetype=ruby:
libs = %w{pp irb/completion irb/ext/save-history}

libs.each do |lib| 
    begin 
        require lib 
    rescue LoadError => err
        $stderr.puts "Couldn't load #{lib}: #{err}"
    end
end

if defined?(wirble)
    Wirble.init && Wirble.colorize
end

IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 150
IRB.conf[:AUTO_INDENT]  = true

class Array
    def inject(n)
        each { |value| n = yield(n, value) }
        n
    end

    def sum
        inject(0) { |n, value| n + value }
    end

    def product
        inject(1) { |n, value| n * value }
    end
end

class Object
    def interesting_methods
        (self.methods - Object.instance_methods).sort
    end
end
