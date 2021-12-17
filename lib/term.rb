require File.expand_path('../../util/JSONify.rb', __FILE__)

class Term < JSONify
  attr_accessor :type, :start_date, :end_date, :classes
  
  def initialize(type, start_date, end_date)
    @type = type
    @start_date = start_date
    @end_data = end_date
    @classes = []
  end

  def hashit
    {
      "type" => @type,
      "start_date" => @start_date,
      "end_date" => @end_date,
      "classes" => @classes.each { |cls| cls.hashit }
    }
  end

  def add_class(cls)
    @classes.push(cls)
  end
end
