class BoxingSchedules::CLI

  def main_menu
    puts "Hello, Welcome to The Boxing Schedules CLI App."
    puts "Which displayed option would you like to select(Type the number to select):"
    puts "1. Fight Channel & Location"
    puts "2. Fight Time"
    puts "3. All Fight Details"
    puts "Type 'exit' to quit."
    puts "Type 'list' to see options again."
  end

  def scheduled_fight_details
    BoxingSchedules::Scraper.scrape_scheduled_fights
    BoxingSchedules::Fight.all.each_with_index do|fight, index|
      puts "---------------------"
      puts "Fight Channel & Location: #{fight.channel_location}"
      puts "Fight Time: #{fight.fight_time}"
      puts "All Fight Details: #{fight.fight_details.gsub("More Details", "")}"
      puts "---------------------"
    end
    #binding.pry
  end

  def start
    user_input = nil
    while user_input != 'exit'
      main_menu
      user_input = gets.strip.downcase
      case user_input
      when '1'
        # get fight dates, display them to the user.
        puts "Fights details:"
        scheduled_fight_details
      when '2'
        # get fight times, display them to the user.
        # puts "fight times:"
        BoxingSchedules::Scraper.scrape_fight_urls
      when '3'
        # get fighter names, display them to the user.
        puts "fighter names:"
        BoxingSchedules::Scraper.scrape_fighter_names
      when '4'
        # get fight location/arena, display it to the user.
        puts "fight channel/location:"
        BoxingSchedules::Scraper.scrape_fight_channels_locations
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
