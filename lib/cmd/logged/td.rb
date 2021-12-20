require_relative '../../../glob.rb'

include Glob

class Td

  def self.call(opts)
  end

  def self.name
    "td"
  end

  def self.desc
    "Select or create a to-do list"
  end

  def self.options
    "\tOptions:\n"\
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
