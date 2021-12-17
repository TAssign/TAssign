Dir.foreach("lib/cmd/") do |file|
  if file != "help.rb" and file != "." and file != ".."
    require_relative file
  end
end

class Help
  def self.call(opts=["help"])
    opts.shift()

    if opts.length == 0
      put_first = [Help, Clear, Quit]
      put_first.each { |cmd|
        doc cmd
      }
      all_cmds(false).each do |cmd|
        if not put_first.include? cmd
          doc cmd
        end
      end
      puts ""
    elsif opts.length > 1
      puts Glob.white("help") + " only takes 0 or 1 arguments."
    elsif all_cmds(true).include? opts[0].capitalize or opts[0] == "exit"
      opt = opts[0]
      if opt == "exit"
        opt = "quit"
      end
      doc(classify(opt))
      puts ""
    else
      puts "Command " + Glob.white(opts[0]) + " not found..."
    end
  end

  def self.name
    "help"
  end

  def self.desc
    "Get information about TAssign commands"
  end

  private
  def self.classify(class_str)
    Object.const_get(class_str.capitalize)
  end
  def self.doc(cmd)
    puts ""
    puts cmd.name + "\n\t" + cmd.desc
    if cmd.methods.include? :options
      puts cmd.options
    end
  end

  def self.all_cmds(str)
    all = []

    Dir.foreach("lib/cmd/") do |file|
      if file != "." and file != ".."
        cmd = File.basename(file, ".rb").capitalize
        if not str
          cmd = classify(cmd)
        end
        all.push(cmd)
      end
    end

    all
  end
end
