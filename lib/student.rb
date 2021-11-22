require File.expand_path('../../util/JSONify.rb', __FILE__)
require_relative '../glob.rb'

include Glob::FileHandler

class Student < JSONify
  attr_accessor :username, :name, :email

  def initialize(username, name="", email="")
    @username = username
    @name = name
    @email = email
  end

  # Get the directory of the student's json file
  # @return [String] the json directory
  def file
    Glob::FileHandler.users + @username + ".json"
  end

  # Get all existing students
  # @return [String] the existing students
  def self.all
    studs = ""

    if Dir.empty?(Glob::FileHandler.users)
      studs = "No user exist yet. Please use " + "stud -n <username>".colorize(:light_white) + " to create a new user.".colorize(:green)
    else
      Dir.foreach(Glob::FileHandler.users) do |name|
        unless name=='.' or name=='..'
          studs += name[0,name.length-5] + "\t"
        end
      end
    end
    studs
  end
end
