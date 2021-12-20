require File.expand_path('../../util/JSONify.rb', __FILE__)

class Course < JSONify
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def hashit
    {
      "name" => @name
    }
  end
end
