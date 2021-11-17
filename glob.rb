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
      "help" => "Get information about TAssign commands.",
      "quit" => "Quit the program",
      "users" => "List existing users.",
      "user" => "  Select or create a user.\n"\
                "  Options:\n"\
                "    -n : user -n newuser\n"\
                "         Creates a new user with username newuser",
      "clear" => "Clear the terminal."
    }
  end
end
