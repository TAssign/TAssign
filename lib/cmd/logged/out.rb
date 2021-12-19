require_relative '../../../glob.rb'

include Glob

class Out
  class Errors
    def self.NotLoggedIn
      "You are not currently logged in."
    end

    def self.InvalidOptions
      Glob.white("out ") + "does not have any options."
    end
  end

  def self.call(opts)
    if opts.length == 1
      if Glob::TassConfig.logged_in?
        puts "Logged out of " + Glob.white(Glob::TassConfig.curr_stud.username) + "."
        Glob::TassConfig.log_out
      else
        puts Errors.NotLoggedIn
      end
    else
      puts Errors.InvalidOptions
    end
  end

  def self.name
    "out"
  end

  def self.desc
    "Log out of the current user"
  end
end
