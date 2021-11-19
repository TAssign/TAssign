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

  # Log in, create a new user, configure users, etc.
  class Stud
    def self.call(options=["stud"])
      options.shift()
      
      if options[0] == "-n"
          if options[1] != nil
            ns = Student.new(username=options[1])
            ns_hash = ns.hash
            Glob::FileHandler.write(ns.file, ns_hash)
            puts "Success.\nUser '" + ns.username + "' created."
          else
            puts "No username entered.\nFollow 'user -n <username>'\n"
          end
      elsif options[0] == "-a"
        puts Student.all
      elsif options[0] == "-av" or options[0] == "-va"
        puts "Student.all WITH VERBOSITY"
      else
        puts "Invalid options. Please see 'help stud' for more information."
      end
    end

    def self.docs
      {
        "stud" => "\tSelect or create a student\n"\
                  "\tOptions:\n"\
                  "\t\t-n".colorize(:light_white) + " : stud -n <username>\n"\
                  "\t\t\tCreates a new student with the username username\n"\
                  "\t\t-a[v] : stud -a[v]\n"\
                  "\t\t\tPrint all existing users.\n\t\t\tUse -av for verbosity."
      }
    end
  end
end
