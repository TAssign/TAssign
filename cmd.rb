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
        case options[1]
        when '-off'
          config_file = Glob::wdir['config']
          config_data = Glob::FileHandler.read(config_file)
          config_data['start_msg'] = false
          Glob::FileHandler.write(config_file, config_data)
        when '-on'
          config_file = Glob::wdir['config']
          config_data = Glob::FileHandler.read(config_file)
          config_data['start_msg'] = true
          Glob::FileHandler.write(config_file, config_data)
        else
          puts "Invalid options for startup config modification"
          puts "Use ".colorize(:green) + " config startup -on/off".colorize(:light_white)
        end
      else
        puts "Invalid config modifications"
      end
    end
  end
end
