require 'colorize'
require 'json'
require_relative 'glob.rb'
require_relative 'lib/student.rb'

include Glob
include Glob::FileHandler


# Handles all TAssign commands which are represented in classes
# Each Command has a static @call method that calls the command
class Cmd

  class Help
    # Print all commands and their descriptions
    def self.call
      Glob::cmds.each do |key, value|
        puts "\n#{key}".colorize(:light_white)
        puts "#{value}".colorize(:green)
      end
      puts ""
    end
  end

  # Clear the console
  class Clear
    def self.call
      puts "\e[H\e[2J"
    end
  end

  # List all existing students
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

  # Log in, create a new user, configure users, etc.
  class Stud
    def self.call(options=["stud"])
      options.shift()
      
      if options[0] == "-n"
          if options[1] != nil
            ns = Student.new(username=options[1])
            ns_hash = ns.hash
            Glob::FileHandler.write(ns.file, ns_hash)
           # puts "Success.\nUser '" + ns.username + "' created."
          else
            puts "No username entered.\nFollow 'user -n <username>'\n"
          end
      else
        puts "Invalid options. Please see 'help stud' for more information."
      end
    end
  end
end
