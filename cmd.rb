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
        puts "\n#{key}"
        puts "#{value}"
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

  class Config
    def self.call(options=["config"])
      options.shift()

      case options[0]
      when "startup"
        on_off = options[1] == '-on' ? true : false
        case options[1]
        when '-off' || '-on'
          config_file = Glob::wdir['config']
          config_data = Glob::FileHandler.read(config_file)
          config_data['start_msg'] = on_off
          Glob::FileHandler.write(config_file, config_data)
        else
          puts "Invalid options for startup config modification"
        end
      else
        puts "Invalid config modifications"
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
  end
end
