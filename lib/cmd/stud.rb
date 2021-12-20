require_relative '../student.rb'
class Stud

  #
  # ERRORS
  #

  class Errors

    def self.NameRedList
      ["-n","-a","-av","-d","-da","off"]
    end

    def self.InvalidStudAll
      "Invalid options for " + Glob.white("stud -a")
    end

    def self.NameNotAllowed(stud, red)
      if red
        Glob.white(stud) + " is not an allowed name."
      else
        "Student " + Glob.white(stud) + " already exists.\n"\
        + "Please use " + Glob.white("stud " + stud) + " to log in."
      end
    end

    def self.InvalidDelete
      "Invalid delete options."
    end

    def self.InvalidYN
      "Invalid options. Please input yY/nN."
    end

    def self.NotLoggedIn
      "You are not currently logged in."
    end

    def self.DeleteWhileIn
      "You cannot delete this user while logged in.\nPlease use " + Glob.white("out") + " to log out."
    end

  end

  #
  # CALL METHOD
  # 

  def self.call(options=["stud"])
    options.shift

    if options[0] == "-n"
      call_cmd(options)
    elsif options.length == 0
      if Glob::TassConfig.logged_in?
        puts "Current student: " + Glob.white(Glob::TassConfig.curr_stud.username)
      else
        puts Errors.NotLoggedIn
      end
    elsif options[0][0...2] == "-d"
      del(options)
    elsif options[0][0...2] == "-a"
      all(options[0])
    elsif Student.all.include? options[0]
      Glob::TassConfig.set_stud(Student.get_stud(options[0]))
    else
      puts "Invalid options or user. Please see " + Glob.white("help stud") + " for more information"
      puts "or use " + Glob.white("stud -a") + " to view existing users."
    end
  end

  #
  # START DOC INFORMATION
  #

  def self.name
    "stud"
  end

  def self.desc
    "Select, create, or switch students"
  end

  def self.options
    ""+Glob.white("\t\t-n") + " : " + Glob.white("stud -n <username>\n")+""\
    "\t\t\tCreates a new student with the username username\n"\
    ""+Glob.white("\t\t-d[a]") + " : " + Glob.white("stud -d <username>") + " or " + Glob.white("stud -da\n")+""\
    "\t\t\tDelete all or one student\n"\
    ""+Glob.white("\t\t-a[v]") + " : " + Glob.white("stud -a[v]\n")+""\
    "\t\t\tPrint all existing users.\n\t\t\tUse " + Glob.white("-av") + " for verbosity."\
  end

  #
  # END DOC INFORMATION
  #
  # START HELPER FUNCTIONS
  #

  private
  #
  # CALL
  #
  def self.call_cmd(options)
    if options[1] != nil
      if Student.all.include? options[1]
        puts Errors.NameNotAllowed(options[1], false)
      elsif Errors.NameRedList.include? options[1]
        puts Errors.NameNotAllowed(options[1], true)
      else
        ns = Student.new(username=options[1])
        ns_hash = ns.hashit
        Glob::FileHandler.write(ns.file, ns_hash)
        puts "Success.\nUser '" + ns.username + "' created."
        if not Glob::TassConfig.logged_in?
          Glob::TassConfig.set_stud(Student.get_stud(options[1]))
        end
      end

      if Student.num_studs == 1
        Config.change_def(["default-stud", options[1]])
        puts "Default user is now " + Glob.white(options[1])
        puts "Use " + Glob.white("help config") + " for default stud configuration"
      end
    else
      puts "No username entered.\nFollow 'stud -n <username>'\n"
    end
  end

  #
  # ALL
  #
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

  #
  # DEL
  #
  def self.del(options)
    if options[0] == "-d" and options.length == 1
      puts Errors.InvalidDelete
    elsif options[0] == "-d" and options.length == 2
      if Glob::TassConfig.logged_in? and options[1] == Glob::TassConfig.curr_stud.username
        puts Errors.DeleteWhileIn
      else
        if Student.exists? options[1]
          print "Are you sure you want to remove " + Glob.white(options[1]) + "? (yY/nN) "
          while true
            conf = gets.chomp
            unless conf.empty?
              if conf.downcase == "y"
                Student.remove(options[1])
                puts "Student " + Glob.white(options[1]) + " removed."
                break
              elsif conf.downcase == "n"
                puts "Cancelled."
                break
              else
                puts Errors.InvalidYN
              end
            end
          end
        else
          puts Glob.white(options[1]) + " does not exist."
        end
      end
    elsif options[0] == "-da"
      if Glob::TassConfig.logged_in?
        puts Errors.DeleteWhileIn
      else
        print "Are you sure you want to remove all users? (yY/nN) "
        while true
          conf = gets.chomp
          unless conf.empty?
            if conf.downcase == "y"
              Student.all.each do |stud|
                Student.remove(stud)
                puts "Student " + Glob.white(stud) + " removed."
              end
              break
            elsif conf.downcase == "n"
              puts "Cancelled."
              break
            else
              puts Errors.InvalidYN
            end
          end
        end
      end
    end
  end
  #
  # END HELPER FUNCTIONS
  #
end
