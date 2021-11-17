require_relative 'glob.rb'

include Glob


module Cmd
  require 'colorize'
  def help
    Glob::cmds.each do |key, value|
      puts "\n#{key}".colorize(:light_white)
      puts "#{value}".colorize(:green)
    end
    puts ""
  end

  def users
    puts "Get users"
  end

  def user
    puts "User"
  end
end
