module Glob
  def users
    '~/.tassign/users.json'
  end

  def years
    '~/.tassign/years/'
  end

  def clear
    puts "\e[H\e[2J"
  end
end


