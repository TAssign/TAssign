require 'colorize'
require_relative 'glob.rb'
require_relative 'lib/student.rb'

include Glob
include Glob::FileHandler


class Cmd

  class Help
    def self.call
      Glob::cmds.each do |key, value|
        puts "\n#{key}".colorize(:light_white)
        puts "#{value}".colorize(:green)
      end
      puts ""
    end
  end

  class Clear
    def self.call
      puts "\e[H\e[2J"
    end
  end

  class Studs
    def self.call(options=["studs"])
      options.shift()

      if options[0] == "-v"
        puts "Verbose studs output"
      elsif options[0] == nil
        puts "Printing all studs"
      end
    end
  end

  class Stud
    def check_exists(stud)

    end

    def self.call(options=["stud"])
      options.shift()
      
      if options[0] == "-n"
          if options[1] != nil
            ns = Student.new(options[1])
            Glob::FileHandler.write(Glob::FileHandler.dirs["studs_sf"], ns.jsonify)
          else
            puts "No username entered.\nFollow 'user -n <username>'\n"
          end
      else
        puts "Invalid options. Please see 'help stud' for more information."
      end
    end
  end
end
