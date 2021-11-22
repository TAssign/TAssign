require 'fileutils'
require 'colorize'
require 'json'
require_relative 'glob.rb'
require_relative 'cmd.rb'

include Glob

begin
  Glob::wdir.each do |key, value|
    unless Dir.exist?(value) or value[-1] != '/'
      FileUtils.mkdir_p(value)
    end
    if File.zero?(Glob::wdir['config'])
      configf = Glob::wdir['config']
      dosm = { "start_msg" => true }
      Glob::FileHandler.write(configf, dosm)
    end
  end
rescue Errno::ENOENT
  raise "Errno::ENOENT - Folder does not exist"
end

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
  "                         \\_______/\n"
]
prompt = "$ "


Cmd::Clear.call
sleep(0.1)
for msg in welcome
  puts "\t" + msg
  sleep(0.01)
end

if Glob::FileHandler.read(Glob::wdir['config'])['start_msg']
  puts "\n\nTo get started. Read the README at https://www.github.com/anseljohn/TAssign."
  puts "Or type " + "help".colorize(:light_white) + " to explore commands.".colorize(:green)
  puts "\nTip: You can stop this message from printing when starting up by entering " + "config startup -off".colorize(:light_white) + "\n\n"
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
      Cmd::Clear.call

    when "stud"
      Cmd::Stud.call(cmds)

    else
      puts "Command '" + cmd + "' does not exist.\nUser 'help' for more info."
    end
  end
end

