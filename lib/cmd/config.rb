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
        puts "Use ".colorize(:green) + " config startup -on/off".colorize(:light_whie)
      end
      if prnt
        puts("Startup message turned" + msg)
      else
        puts("Startup message already" + msg)
      end
    else
      puts "Invalid config modifications"
    end
  end
end
