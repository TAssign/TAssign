require File.expand_path('../../util/JSONify.rb', __FILE__)

class Student < JSONify
  attr_accessor :name, :email

  def initialize(name, email="")
    @name = name
    @email = email
  end

end
