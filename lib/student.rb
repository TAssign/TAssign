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
    Glob::FileHandler.users + @username + "/config.json"
  end

  def hashit
    {
      "username" => @username,
      "name" => name,
      "email" => email
    }
  end

  def self.exists?(name)
    return Student.all.include? name
  end

  def self.remove(name)
    pth = Student.get_stud(name).file
    File.delete(pth) if File.exist?(pth)
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
    if not Dir.empty?(Glob::FileHandler.users)
      Dir.chdir(Glob::FileHandler.users) do
        Dir.glob('*').select { |f| all.push(f) }
      end
    end
    all
  end
end

puts Student.all
