class BoxingSchedules::CLI

  def main_menu
    puts "Hello, Welcome to The Boxing Schedules CLI App."
    puts "Which displayed option would you like to select(Type the number to select):"
    puts "1. All Fight Details"
    puts "2. Fight Channels & Locations"
    puts "3. Fight Times"
    puts "4. Fighter Names"
    puts "Type 'exit' to quit."
    puts "Type 'list' to see options again."
  end

  def scheduled_fight_details
    BoxingSchedules::Scraper.scrape_scheduled_fights
    BoxingSchedules::Fight.all.each_with_index do|fight, index|
      puts "---------------------"
      puts "Fight ##{index+1}"
      puts "Fight Channel & Location: #{fight.channel_location}"
      puts "Fight Time: #{fight.fight_time}"
      puts "Fighter Names: #{fight.fighter_names}"
      puts "All Fight Details: #{fight.fight_details.gsub("More Details", "")}"
      puts "Fight Link: #{fight.fight_url}"
      puts "---------------------"
    end
    #binding.pry
  end

  def fight_channels_locations
    BoxingSchedules::Scraper.scrape_scheduled_fights
    BoxingSchedules::Fight.all.each_with_index do|fight, index|
      if index < 21
        puts "Fight ##{index+1} #{fight.channel_location}"
      end
    end
  end

  def fight_times
    BoxingSchedules::Scraper.scrape_scheduled_fights
    BoxingSchedules::Fight.all.each_with_index do|fight, index|
      if index < 21
        puts "Fight ##{index+1} #{fight.fight_time}"
      end
    end
  end


  def fight_names
    BoxingSchedules::Scraper.scrape_scheduled_fights
    BoxingSchedules::Fight.all.each_with_index do|fight, index|
      if index < 21
        puts "Fight ##{index+1} #{fight.fighter_names}"
      end
    end
  end


  def start
    user_input = nil
    while user_input != 'exit'
      main_menu
      user_input = gets.strip.downcase
      case user_input
      when '1'
        scheduled_fight_details
      when '2'
        fight_channels_locations
      when '3'
        fight_times
      when '4'
        fight_names
      when 'exit'
        puts "Goodbye!"
      when 'list'
        main_menu
      else
        puts "Invalid input, that is not an option."
      end
    end
  end
end
