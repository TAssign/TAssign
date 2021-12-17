require 'ostruct'
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

  def hashit
    {
      "username" => @username,
      "name" => name,
      "email" => email
    }
  end

  def self.get_stud(name)
    stud = OpenStruct.new(Glob::FileHandler.read(Glob::FileHandler.users + name + ".json"))
    Student.new(stud["username"], stud["name"], stud["email"])
  end

  # Get all existing students
  # @return [String] the existing students
  def self.all
    studs = ""
    all = []
    if Dir.empty?(Glob::FileHandler.users)
    else
      Dir.foreach(Glob::FileHandler.users) do |name|
        unless name=='.' or name=='..'
          all.push(name[0,name.length-5])
        end
      end
    end
    all
  end
end
