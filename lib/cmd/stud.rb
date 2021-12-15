require_relative '../student.rb'
class Stud
  def self.call(options=["stud"])
    options.shift

    if options[0] == "-n"
        if options[1] != nil
          ns = Student.new(username=options[1])
          ns_hash = ns.hash
          Glob::FileHandler.write(ns.file, ns_hash)
          puts "Success.\nUser '" + ns.username + "' created."
        else
          puts "No username entered.\nFollow 'stud -n <username>'\n"
        end
    elsif options[0] == "-a"
      puts Student.all
    elsif options[0] == "-av" or options[0] == "-va"
      puts "Student.all WITH VERBOSITY"
    else
      puts "Invalid options. Please see 'help stud' for more information."
    end
  end

  def self.name
    "stud"
  end

  def self.desc
    "Select or create a student"
  end

  def self.options
    "\tOptions:\n"\
    ""+Glob.white("\t\t-n") + " : " + Glob.white("stud -n <username>\n")+""\
    "\t\t\tCreates a new student with the username username\n"\
    ""+Glob.white("\t\t-a[v]") + " : " + Glob.white("stud -a[v]\n")+""\
    "\t\t\tPrint all existing users.\n\t\t\tUse " + Glob.white("-av") + " for verbosity."
  end
end

puts Stud.name
puts Stud.desc
puts Stud.options
