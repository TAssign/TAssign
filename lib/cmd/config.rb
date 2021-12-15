require_relative '../../glob.rb'

include Glob
include Glob::FileHandler

class Config
  def self.call(options=["config"])
    options.shift()

    case options[0]
    when "startup"
      msg = "Startup message turned "
      case options[1]
      when 'off'
        config_file = Glob::wdir['config']
        config_data = Glob::FileHandler.read(config_file)
        config_data['start_msg'] = false
        Glob::FileHandler.write(config_file, config_data)
        msg += "off."
      when 'on'
        config_file = Glob::wdir['config']
        config_data = Glob::FileHandler.read(config_file)
        config_data['start_msg'] = true
        Glob::FileHandler.write(config_file, config_data)
        msg += "on."
      else
        puts "Invalid options for startup config modification"
        puts "Use ".colorize(:green) + " config startup -on/off".colorize(:light_whie)
      end
      puts(msg)
    else
      puts "Invalid config modifications"
    end
  end
end
