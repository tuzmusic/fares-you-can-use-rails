class Seeds

  def self.run_cli(args=[])
    self.prompt
    input = args[1] || $stdin.gets.strip.downcase
      case input
      when 'r' then Region.import_all
      when 'a' then Airport.import_all_from_gem
      when 'd' then Deal.import
      when 'c' then State.import_all_and_assign_to_airports
      when 's' then Region.assign_us_states
      when 'q' then abort "Quitting."
      end
    self.run_cli
  end
  
  def self.prompt 
    puts ""
    puts "Choose what to seed:"
    puts "[R]egions (currently #{Region.count})"
    puts "[A]irports (currently #{Airport.count})"
    puts "[D]eals (currently #{Deal.count})"
    puts "[C]reate states (if needed) and assign to airports (currently #{State.count})"
    puts "Assign [S]tates to Regions (currently #{State.where.not(region:nil).count} states have regions)"
    puts "[Q]uit" 
  end
end 
ARGV.clear if ARGV[1].include?("RAILS_ENV")
Seeds.run_cli(ARGV)
