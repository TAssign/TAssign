Dir.foreach("lib/cmd/") do |file|
  if File.file?(file) and file != "help.rb" and file != "." and file != ".."
    require_relative file
  elsif File.directory?(file)
    Dir.foreach("lib/cmd/" + file) do |file|
      if File.file?(file) and file != "." and file != ".."
        require_relative file
      end
    end
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
      cmds(false, Glob::TassConfig.logged_in?).each do |cmd|
        if not put_first.include? cmd
          doc cmd
        end
      end
      puts ""
    elsif opts.length > 1
      puts Glob.white("help") + " only takes 0 or 1 arguments."
    elsif cmds(true, Glob::TassConfig.logged_in?).include? opts[0].capitalize or opts[0] == "exit"
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
    Object.const_get(class_str)
  end
  def self.doc(cmd)
    puts ""
    puts cmd.name + "\n\t" + cmd.desc
    if cmd.methods.include? :options
      puts cmd.options
    end
  end

  def self.dir_cmds(dir, str)
    cmds = []
    Dir.foreach(dir) do |file|
      if file != "." and file != ".." and File.file?(dir+file)
        cmd = File.basename(file, ".rb").capitalize
        if not str
          cmd = classify(cmd)
        end
        cmds.push(cmd)
      end
    end
    cmds
  end

  def self.cmds(str, logged) 
    all = dir_cmds("lib/cmd/", str)
    all.concat(dir_cmds("lib/cmd/logged/", str))
    all
  end
end
