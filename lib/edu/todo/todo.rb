require_relative "task.rb"
class Todo
  attr_accessor :name, :tasks
  
  def initialize(name)
    @name = name
    @tasks = {}
  end

  def hashit
    tasks_hash = []

    @tasks.each do |task|
      tasks_hash.push(task.hashit)
    end

    {
      "name" => @name,
      "tasks" => tasks_hash
    }
  end

  def add_task(task)
    @tasks[task.name] = task
  end

  def display

    max_l = 0
    @tasks.each do |name, task|
      max_l = name.length > max_l ? name.length : max_l
    end

    max_l += 7
    formatter = '%-' + max_l.to_s + '.' + max_l.to_s + 's'
    
    print " "
    for i in 1...max_l+2 do
      print "_"
    end
    puts ""
    walls(formatter)
    print "| "
    print formatter % @name
    puts "|"
    walls(formatter)
    i=0
    @tasks.each do |name, task|
      print "| "
      print formatter % ("(" + i.to_s + ")  " + name)
      puts "|"
      i+=1
    end
    walls(formatter)
    floor(max_l)
  end

  private

  def walls(formatter)
    print "| "
    print formatter % " "
    puts "|"
  end

  def floor(max_l)
    print "|"
    for i in 1...max_l+2 do
      print "_"
    end
    puts("|")
  end

end
x = Todo.new("John's List")
x.add_task(Task.new("this"))
x.add_task(Task.new("this"))
x.add_task(Task.new("everything"))
x.add_task(Task.new("This is a long to do list item"))
x.add_task(Task.new("Now this is an even longer, super duper long list item"))
x.display
