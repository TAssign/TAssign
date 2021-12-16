require_relative '../student.rb'
class Stud

  class Errors
    def InvalidStudAll
      "Invalid options for " + Glob.white("stud -a")
    end
  end


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
    elsif options[0][0...2] == "-a"
      all(options[0])
    elsif Student.all.include? options[0]
      puts "Log in to " + options[0]
    else
      puts "Invalid options or user. Please see " + Glob.white("help stud") + " for more information"
      puts "or use " + Glob.white("stud -a") + " to view existing users."
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

  private
  def self.all(opts)
    if opts.length > 3
      puts Errors.InvalidStudAll
    elsif opts.length == 3
      if opts[2] == "v"
        puts "Student.all WITH VERBOSITY"
      else
        puts Errors.InvalidStudAll
      end
    else
      studs = ""
      if Student.all.length == 0
        studs = "No user exist yet. Please use " + Glob.white("stud -n <username>") + " to create a new user."
      else
        Student.all.each do |stud|
          studs += stud + "\t"
        end
      end
      puts studs
    end
  end
end

