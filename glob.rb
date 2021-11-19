module Glob
  module FileHandler
    require 'json'

    bin = '/usr/local/bin'
    @@dirs = {
      "tass_sf" => bin + '/tassign/',
      "studs_sf" => bin + '/tassign/studs/',
      "years_sf" => bin + '/tassign/years/'
    }

    def dirs
      @@dirs
    end
  
    def users
      @@dirs["studs_sf"]
    end

    def years
      @@dirs["years_sf"]
    end

    def read(file)
      if File.exists?(file)
        in_file = File.read(file)
        data = JSON.parse(in_file)
        return data
      else
        return false
      end
    end

    def write(file, data)
      if File.exists?(file)
        out_file = File.open(file, "w+")
        out_file.write(JSON.pretty_generate(data))
        out_file.close
      else
        File.new(file, "w+")
        write(file, data)
      end
    end

  end

  def cmds
    {
      "help" => "\tGet information about TAssign commands",
      "quit" => "\tQuit the program",
      "studs" => "\tList existing students",
      "stud" => "\tSelect or create a student\n"\
                "\tOptions:\n"\
                "\t\t-n : stud -n <username>\n"\
                "\t\t\tCreates a new student with the username username",
      "clear" => "\tClear the terminal"
    }
  end
end
