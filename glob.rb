module Glob
  module FileHandler
    require 'json'

    class Sysfile
      def initialize(name)
        @name = name
      end

      def name
        return @name
      end

      def self.sysfile_status(obj)
        if not file.is_a?("Sysfile")
          raise "ArgumentError: Sysfile required"
        end
      end
    end
    
    uf = Sysfile.new('~/.tassign/users.json')
    yf = Sysfile.new('~/.tassign/years/')
    def users
      uf
    end

    def years
      yf
    end

    def read(file)
      Sysfile.sysfile_status
      if File.exists?(file.name)
        in_file = File.read(file.name)
        data = JSON.parse(in_file)
        return data
      else
        return false
      end
    end

    def write(file, data)
      Sysfile.sysfile_status
      if (File.exists?(file.name))
        out_file = File.open(file.name)
        out_file.puts(text)
        out_file.close
      else
        File.new(file.name, "w+")
        write(file, text)
      end
    end

    def check(name)
    end
  end

  def cmds
    {
      "help" => "\tGet information about TAssign commands",
      "quit" => "\tQuit the program",
      "users" => "\tList existing users",
      "user" => "\tSelect or create a user\n"\
                "\tOptions:\n"\
                "\t\t-n : user -n newuser\n"\
                "\t\t\tCreates a new user with username newuser",
      "clear" => "\tClear the terminal"
    }
  end
end
