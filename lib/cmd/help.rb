class Help
  # Print all commands and their descriptions
  def self.call
    Glob::cmds.each do |key, value|
      puts "\n#{key}"
      puts "#{value}"
    end
    puts ""
  end
end
