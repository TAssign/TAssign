require_relative "task.rb"
class Todo
  attr_accessor :name, :tasks
  
  def initialize(name)
    @name = name
    @tasks = {}
  end

  def add_task(task)
    @tasks[task.name] = task
  end

  def display
    puts ""
    puts "|" + " " + @name
    puts ""
    i=0

    max_l = 0
    @tasks.each do |name, task|
      max_l = name.length > max_l ? name.length : max_l
    end

    max_l += 7
    formatter = '%-' + max_l.to_s + '.' + max_l.to_s + 's'

    @tasks.each do |name, task|
      puts formatter % ( i.to_s + "  " + name + "\t|")
      i+=1
    end
    puts ""
  end
end
x = Todo.new("John's List")
x.add_task(Task.new("this"))
x.add_task(Task.new("this"))
x.add_task(Task.new("everything"))
x.display
