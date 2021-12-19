require_relative '../../glob.rb'

include Glob
include Glob::FileHandler

class Config
  def self.call(options=["config"])
    options.shift()

    case options[0]
    when "startup"
      prnt = false
      msg = ""
      case options[1]
      when 'off'
        config_file = Glob::wdir['config']
        config_data = Glob::FileHandler.read(config_file)
        if config_data['start_msg'] == true
          config_data['start_msg'] = false
          Glob::FileHandler.write(config_file, config_data)
          prnt = true
        end
        msg += " off."
      when 'on'
        config_file = Glob::wdir['config']
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
    else
      puts "Invalid config modifications."
      puts "Please use " + Glob.white("help config") + " for more information."
    end
  end

  def self.name
    "config"
  end

  def self.desc
    "Configure TAssign options"
  end

  def self.options
      ""+Glob.white("\t\tstartup on[off]") + " : " + Glob.white("config startup off")+"\n"\
      "\t\t\tTurn off the startup tip for getting started."
  end
end

