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
        if not obj.is_a?(Sysfile)
          raise "ArgumentError: Sysfile required"
        end
      end
    end
    
    bin = '/usr/local/bin'
    @@dirs = {
      "tass_sf" => Sysfile.new(bin + '/tassign/'),
      "users_sf" => Sysfile.new(bin + '/tassign/users.json'),
      "years_sf" => Sysfile.new(bin + '/tassign/years/')
    }

    def dirs
      @@dirs
    end
  
    def users
      @@dirs["tass_sf"]
    end

    def years
      @@dirs["years_sf"]
    end

    def read(file)
      Sysfile.sysfile_status(file)
      if File.exists?(file.name)
        in_file = File.read(file.name)
        data = JSON.parse(in_file)
        return data
      else
        return false
      end
    end

    def write(file, data)
      Sysfile.sysfile_status(file)
      if File.exists?(file.name)
        out_file = File.open(file.name, "w+")
        out_file.write(JSON.pretty_generate(data))
        out_file.close
      else
        File.new(file.name, "w+")
        write(file, data)
      end
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
