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

  def cmds
    {
      "help" => "\tGet information about TAssign commands",
      "quit" => "\tQuit the program",
      "users" => "\tList existing users",
      "user" => "\tSelect or create a user\n"\
                "\tOptions:\n"\
                "\t\t-n : user -n newuser\n"\
                "\t\t\tCreates a new user with username newuser",
      "clear" => "\tClear the terminal"
    }
  end
end
