Dir.foreach("lib/cmd/") do |file|
  if file != "help.rb" and file != "." and file != ".."
    require_relative file
  end
end

class Help
  def self.call(opts)
    put_first = [Help, Clear, Quit]
    put_first.each { |cmd|
      doc cmd
    }
    all_cmds.each do |cmd|
      if not put_first.include? cmd
        doc cmd
      end
    end
    puts ""
  end

  def self.name
    "help"
  end

  def self.desc
    "Get information about TAssign commands"
  end

  private
  def self.doc(cmd)
    puts ""
    puts cmd.name + "\n\t" + cmd.desc
    if cmd.methods.include? :options
      puts cmd.options
    end
  end

  def self.all_cmds
    all = []

    Dir.foreach("lib/cmd/") do |file|
      if file != "." and file != ".."
        cmd = Object.const_get(File.basename(file, ".rb").capitalize)
        all.push(cmd)
      end
    end

    all
  end
end
