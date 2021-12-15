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
end
