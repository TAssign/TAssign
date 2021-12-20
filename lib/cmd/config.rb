require_relative '../../glob.rb'

include Glob

class Config
  def self.call(options=["config"])
    options.shift()

    case options[0]
    when "startup"
      startup(options)
    when "default-stud"
      change_def(options)
    else
      puts "Invalid config modifications."
      puts "Please use " + Glob.white("help config") + " for more information."

    end

  end

  #
  # Documentation
  #
  def self.name
    "config"
  end

  def self.desc
    "Configure TAssign options"
  end

  def self.options
      ""+Glob.white("\t\tstartup on[off]") + " : " + Glob.white("config startup off")+"\n"\
      "\t\t\tTurn off the startup tip for getting started.\n"\
      ""+Glob.white("\t\tdefault-stud <username>/off") + " : " + Glob.white("config default-stud doe")+"\n"\
      "\t\t\tChange the default student to log into\n"\
      "\t\t\tUse " + Glob.white("config default-stud off") + " to turn off default stud."
  end

  #
  # Helper methods
  #

  #
  # Change default stud
  #
  def self.change_def(options)
    if Student.exists?(options[1]) and Glob::TassConfig.def_stud != options[1] or options[1] == nil
      conf = Glob::FileHandler.wdir['config']
      df = Glob::FileHandler.read(conf)
      df['default_stud'] = options[1]
      Glob::FileHandler.write(conf, df)
      if options[1] != nil
        puts "Changed default user to " + Glob.white(options[1])
      else
        puts "Turned off default stud."
      end
    elsif options[1] == "off"
      change_def(["default-stud",nil])
    else
      puts "Error"
    end
  end

  private
  #
  # Change startup options
  #
  def self.startup(options)
    prnt = false
    msg = ""
    case options[1]
    when 'off'
      config_file = Glob::FileHandler.wdir['config']
      config_data = Glob::FileHandler.read(config_file)
      if config_data['start_msg'] == true
        config_data['start_msg'] = false
        Glob::FileHandler.write(config_file, config_data)
        prnt = true
      end
      msg += " off."
    when 'on'
      config_file = Glob::FileHandler.wdir['config']
      config_data = Glob::FileHandler.read(config_file)
      if config_data['start_msg'] == false
        config_data['start_msg'] = true
        Glob::FileHandler.write(config_file, config_data)
        prnt = true
      end
      msg += " on."
    else
      puts "Invalid options for startup config modification"
      puts "Use " + Glob.white(" config startup -on/off")
    end
    if prnt
      puts("Startup message turned" + msg)
    else
      puts("Startup message already" + msg)
    end
  end

end

