# Global methods and variables
module Glob
  require "colorize"
  #
  # Colorize functions for easier colorizing
  #

  def Glob.white(str)
    str.colorize(:light_white)
  end

  # Methods and variables pertaining to file io
  module FileHandler
    require 'json'

    bin = '/usr/local/bin'
    # File locations
    @@wdir = {
      "tass_sf" => bin + '/tassign/',
      "studs_sf" => bin + '/tassign/studs/',
      "years_sf" => bin + '/tassign/years/',
      "config" => bin + '/tassign/config.json'
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
      Glob.white("help") => "\tGet information about TAssign commands",
      Glob.white("quit") => "\tQuit the program",
      Glob.white("config") => "\tConfigure TAssign options.\n"\
                              "\tOptions:\n"\
                              ""+Glob.white("\t\tstartup on[off]") + " : " + Glob.white("config startup off")+"\n"\
                              "\t\t\tTurn off the startup tip for getting started.",
      Glob.white("clear") => "\tClear the terminal",
      Glob.white("stud") => "\tSelect or create a student\n"\
                            "\tOptions:\n"\
                            ""+Glob.white("\t\t-n") + " : " + Glob.white("stud -n <username>\n")+""\
                            "\t\t\tCreates a new student with the username username\n"\
                            ""+Glob.white("\t\t-a[v]") + " : " + Glob.white("stud -a[v]\n")+""\
                            "\t\t\tPrint all existing users.\n\t\t\tUse " + Glob.white("-av") + " for verbosity."
     
    }
  end
end
