# Global methods and variables
module Glob
  require 'colorize'
  #
  # Colorize functions for easier colorizing
  #

  def Glob.white(str)
    str.colorize(:light_white)
  end


  #
  # Tass Config
  #
  class TassConfig

    #
    # Start message activated?
    #
    def self.start_msg?
      Glob::FileHandler.read(Glob::FileHandler.wdir['config'])['start_msg']
    end

    #
    # Is there a default stud?
    #
    def self.has_def_stud?
      def_stud != nil
    end
    
    #
    # Get default stud
    #
    def self.def_stud
      Glob::FileHandler.read(Glob::FileHandler.wdir['config'])['default_stud']
    end
    
    #
    # Prompt configurations
    #
    @base_pr = "$ "
    @pr = "$ "
    def self.prompt
      @pr
    end

    def self.set_prompt(prmp)
      @pr = prmp
    end

    #
    # Student login configurations
    #
    @curr_stud = nil
    def self.set_stud(stud)
      if stud.is_a?(String)
        stud = Student.get_stud(stud)
      end
      @curr_stud = stud
      set_prompt("(" + Glob.white(@curr_stud.username) + ") $ ")
      puts "Successfully logged into " + Glob.white(@curr_stud.username)
    end

    def self.curr_stud
      @curr_stud
    end

    def self.logged_in?
      @curr_stud != nil
    end

    def self.log_out
      @curr_stud = nil
      set_prompt(@base_pr)
    end
  end

  # Methods and variables pertaining to file io
  class FileHandler
    require 'json'

    bin = '/usr/local/bin'
    # File locations
    @wdir = {
      "tass_sf" => bin + '/tassign/',
      "studs_sf" => bin + '/tassign/studs/',
      "terms_sf" => bin + '/tassign/terms/',
      "config" => bin + '/tassign/config.json'
    }

    # TAssign working directory
    def self.wdir
      @wdir
    end
  
    # Directory for all users
    def self.users
      @wdir["studs_sf"]
    end

    #Directory for all years
    def self.years
      @wdir["years_sf"]
    end

    # Read json file to hash
    # @param [String] the file location to read to hash
    # @return [Hash] the hashed json data or [false] if unable to find file
    def self.read(file)
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
    def self.write(file, data)
      if File.exists?(file)
        out_file = File.open(file, "w+")
        out_file.write(JSON.pretty_generate(data))
        out_file.close
      else
        FileUtils.mkdir_p(File.dirname(file))
        File.new(file, "w+")
        write(file, data)
      end
    end
  end
end
