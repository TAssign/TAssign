require_relative 'glob.rb'
require_relative 'cmd.rb'

include Glob
#include Cmd

welcome = Array[
  "  ___________________",
  "' ,__________,  ':  `.",
  "| '            `  |    `.",
  "| |   Welcome  |  |      `.",
  "| |     to     |  |        \\      The text-based,",
  "| |   TAssign  |  |         ]          code junky,",
  "| |            |  |~~~~~~.  )            student planner.",
  "| `,__________,'  |\\__O\\_| ,'",
  "|    _______      |     \\.`",
  "|<> [___=___](@)<>|    .'\\",
  "':________________/__.'   )",
  "   (____________)        /",
  "                        /",
  "              _________/",
  "  ___________/______",
  " /''''=========='(@)\\___",
  " |[][][][][][][][][]|   \\ _______",
  " |[][][][][][][][][]|    \\__     \\",
  " |[][][][][][][][][]|    |  \..  |",
  " \\------------------/    | ( # ) |",
  "                         |  '''  |",
  "                         \\_______/"
]
prompt = "$ "



Glob::clear
sleep(0.1)
for msg in welcome
  puts "\t" + msg
  sleep(0.01)
end


while true
  print prompt
  cmd = gets.chomp
  
  unless cmd.empty?
    cmds = cmd.split(' ')

    case cmds[0]
    when "help"
      Cmd::Help.call

    when "quit"
      puts "Goodbye."
      break

    when "clear"
      Cmd::clear

    when "users"
      Cmd::Users.call(cmds)

    when "user"
      Cmd::User.call(cmds)

    else
      puts "Command '" + cmd + "' does not exist.\nUser 'help' for more info."
    end
  end
end

