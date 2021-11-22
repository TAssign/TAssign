# Global methods and variables
module Glob
  require 'colorize'

  # Methods and variables pertaining to file io
  module FileHandler
    require 'json'

    bin = '/usr/local/bin'
    # File locations
    @@wdir = {
      "tass_sf" => bin + '/tassign/',
      "studs_sf" => bin + '/tassign/studs/',
      "years_sf" => bin + '/tassign/years/'
    }

    # TAssign working directory
    def wdir
      @@wdir
    end
  
    # Directory for all users
    def users
      @@wdir["studs_sf"]
    end

    #Directory for all years
    def years
      @@wdir["years_sf"]
    end

    # Read json file to hash
    # @param [String] the file location to read to hash
    # @return [Hash] the hashed json data or [false] if unable to find file
    def read(file)
      if File.exists?(file)
        in_file = File.read(file)
        data = JSON.parse(in_file)
        return data
      else
        return false
      end
    end

    # Write to json
    # @param [String] the file location to write to
    # @param [Hash] the data to jsonify
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

  # Get command documentation
  def cmds
    {
      "help".colorize(:light_white) => "\tGet information about TAssign commands",
      "quit".colorize(:light_white) => "\tQuit the program",
      "clear".colorize(:light_white) => "\tClear the terminal",
      "stud".colorize(:light_white) => "\tSelect or create a student\n".colorize(:green)+""\
      "\tOptions:\n".colorize(:green)+""\
                      "\t\t-n".colorize(:light_white) + " : " + "stud -n <username>\n".colorize(:light_white)+""\
                      "\t\t\tCreates a new student with the username username\n".colorize(:green)+""\
                      "\t\t-a[v]".colorize(:light_white) + " : " + "stud -a[v]\n".colorize(:light_white)+""\
                      "\t\t\tPrint all existing users.\n\t\t\tUse " + "-av".colorize(:light_white) + " for verbosity."
     
    }
  end
end
