class Clear
  def self.call
    puts "\e[H\e[2J"
  end

  def self.name
    "clear"
  end

  def self.desc
    "Clear the terminal"
  end
end
