require_relative 'glob.rb'
include Glob

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

Glob::clear
sleep(0.5)
for msg in welcome
  puts "\t" + msg
  sleep(0.01)
end

sleep(0.25)

while true
  print "$ "
  cmd = gets.chomp
  if cmd == "help"
    
  elsif cmd == "users"
    if (not File.exists?(Glob::users))
      puts "No users exist.\nUser 'user -n username' to create a new user."
    end
  elsif cmd == "quit"
    puts "Goodbye."
    break
  else
    puts "Command '" + cmd + "' not found."
    puts "User 'help' for more information."
  end
end

