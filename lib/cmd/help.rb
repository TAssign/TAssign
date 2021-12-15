Dir.foreach("lib/cmd/") do |file|
  if file != "help.rb" and file != "." and file != ".."
    require_relative file
  end
end

class Help
  # Print all commands and their descriptions
  def self.call
    put_first = [Help, Clear, Quit]
    put_first.each { |cls|
      doc cls
      puts ""
    }
    
    Dir.foreach("lib/cmd/") do |file|
      if file != "." and file != ".."
        cls = Object.const_get(File.basename(file, ".rb").capitalize)
        if not put_first.include? cls
          puts cls.name + "\t" + cls.desc
          if cls.methods.include? :options
            puts cls.options
          end
          puts ""
        end
      end
    end
    puts ""
  end

  def self.name
    "help"
  end

  def self.desc
    "Get information about TAssign commands."
  end

  private
  def self.doc(cls)
    puts cls.name "\t" + cls.desc
    if cls.methods.include? :options
      puts cls.options
    end
    puts""
  end
end
