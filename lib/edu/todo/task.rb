class Task
  attr_accessor :name, :desc, :is_complete, :due_date, :due_time

  def initialize(name)
    @name = name
    @is_complete = false
  end

  def hashit
    {
      "name" => @name,
      "desc" => @desc,
      "is_complete" => @is_complete,
      "due_date" => @due_date,
      "due_time" => @due_time
    }
  end
end
