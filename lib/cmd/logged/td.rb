require_relative '../../../glob.rb'

include Glob

class Td

  def self.call(opts)
    if opts[0] == "-n"
      puts "cool"
    else
      puts "Invalid " + "td".light_white + " options"
    end
  end

  def self.name
    "td"
  end

  def self.desc
    "Select or create a to-do list"
  end

  def self.options
    ""+Glob.white("\t\t-n") + " : " + Glob.white("td -n name")+"\n"\
    "\t\t\tCreate a new to-do list with name " + Glob.white("name\n")+""\
    ""+Glob.white("\t\t-d") + " : " + Glob.white("td -d name")+"\n"\
    "\t\t\tDelete a to-do list with name " + Glob.white("name")
  end


  private

  def self.new_list(options)
    
  end

  def self.del_list(options)

  end
end

