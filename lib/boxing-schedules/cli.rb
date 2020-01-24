class BoxingSchedules::CLI

  def main_menu
    puts "Hello, Welcome to #{"The Boxing Schedules CLI App".blue}."
    puts                      "\t\t  ----------------------------".red
    puts "Which displayed option would you like to select(Type the number to select):"
    puts "1. All Fight Details"
    puts "2. Fight Channels & Locations"
    puts "3. Fight Times"
    puts "4. Fighter Names"
    puts "5. Fight Links"
    puts "Type 'exit' to quit."
    puts "Type 'list' to see options again."
  end

  def scheduled_fight_details
    BoxingSchedules::Fight.all.each_with_index do|fight, index|
      puts "----------------------------".red + "#{"BOXING SCHEDULES".blue}" + "--------------------------------------".red
      puts "Fight ##{index+1}"
      puts "Fight Channel & Location: #{fight.channel_location}"
      puts "Fight Time: #{fight.fight_time}"
      puts "Fighter Names: #{fight.fighter_names}"
      puts "All Fight Details: #{fight.fight_details.gsub("More Details", "")}"
      puts "Fight Link:" + "#{fight.fight_url}".yellow
      puts "----------------------------------------------------------------------------------".red
    end
  end

  def fight_channels_locations
    BoxingSchedules::Fight.all.each_with_index do|fight, index|
      if index < 21
        puts "Fight ##{index+1} #{fight.channel_location}"
      end
    end
  end

  def fight_times
    BoxingSchedules::Fight.all.each_with_index do|fight, index|
      if index < 21
        puts "Fight ##{index+1} #{fight.fight_time}"
      end
    end
  end


  def fight_names
    BoxingSchedules::Fight.all.each_with_index do|fight, index|
      if index < 21
        puts "Fight ##{index+1} #{fight.fighter_names}"
      end
    end
  end

  def fight_urls
    BoxingSchedules::Fight.all.each_with_index do|fight, index|
      if index < 21
        puts "Fight ##{index+1} #{fight.fight_url}"
      end
    end
  end


  def start
    BoxingSchedules::Scraper.scrape_scheduled_fights
    user_input = nil
    while user_input != 'exit'
      main_menu
      user_input = gets.strip.downcase
      case user_input
      when '1'
        puts "All Fight Details:".red
        scheduled_fight_details
      when '2'
        puts "Fight Channels & Locations:".red
        fight_channels_locations
      when '3'
        puts "Fight Times:".red
        fight_times
      when '4'
        puts "Fighter Names:".red
        fight_names
      when '5'
        puts "Fight Links:".red
        fight_urls
      when 'exit'
        puts "Goodbye from The Boxing Schedules CLI App!"
      when 'list'
        main_menu
      else
        puts "Invalid input, that is not an option."
      end
    end
  end
end
