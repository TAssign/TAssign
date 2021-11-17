require_relative 'glob.rb'
require_relative 'cmd.rb'

include Glob
include Cmd

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
for msg in welcome
  puts "\t" + msg
  sleep(0.01)
end

sleep(0.25)

while true
  print prompt
  cmd = gets.chomp
  
  unless cmd.empty?
    case cmd
    when "help"
      Cmd::help

    when "quit"
      puts "Goodbye."
      break

    when "clear"
      Cmd::clear

    when "users"
      Cmd::users

    when "user"
      Glob::clear

    else
      puts "Command '" + cmd + "' does not exist.\nUser 'help' for more info."
    end
  end
    #if (not File.exists?(Glob::users))
end

