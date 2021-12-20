class Task
  attr_accessor :name, :desc, :is_complete, :due_date, :due_time

  def initialize(name)
    @name = name
    @is_complete = false
  end
end
