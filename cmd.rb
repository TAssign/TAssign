require 'colorize'
require_relative 'glob.rb'

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

  class Users
    def self.call(options=["users"])
      options.shift()

      if options[0] == "-v"
        puts "Verbose users output"
      elsif options[0] == nil
        puts "Printing all users"
      end
    end
  end

  class User
    def check_exists(user)

    end

    def self.call(options=["user"])
      options.shift()
      
      if options[0] == "-n"
          if options[1] != nil
            Glob::FileHandler::write(Glob::FileHandler::users, options[1])
          else
            puts "No username entered.\nFollow 'user -n <username>'\n"
          end
      else
        puts "Invalid options. Please see 'help user' for more information."
      end
    end
  end
end
