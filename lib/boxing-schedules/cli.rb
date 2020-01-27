class BoxingSchedules::CLI

  # displays main menu for fight options
  def main_menu
    puts                      "\t\t  -----------------------------".red
    puts "Hello, Welcome to #{"The Boxing Schedules CLI App".blue}"
    puts                      "\t\t  -----------------------------".red
    puts "Which displayed option would you like to select(Type the number to select):"
    puts "1. All Fight Details"
    puts "2. Fight Channels & Locations"
    puts "3. Fight Times"
    puts "4. Fighter Names"
    puts "5. Fight Links"
    puts "Type 'exit' to quit."
    puts "Type 'list' to see options again."
  end

  # Calls on Scraper class method
  def scheduled_fights_scraper
    BoxingSchedules::Scraper.scrape_scheduled_fights
  end

  # Gets all fight objects from Fight class
  def number_of_fights
    BoxingSchedules::Fight.all
  end

  # iterates through all fight instances of Fight.all and grabs the attributes
  # to display each fight details to the user.
  def scheduled_fight_details
    number_of_fights.each_with_index do|fight, index|
      puts "----------------------------".red + "#{"BOXING SCHEDULES".blue}" + "------------------------------------------------".red
      puts "Fight ##{index+1}".red
      puts "Fight Channel & Location: #{fight.channel_location}"
      puts "Fight Time: #{fight.fight_time}"
      puts "Fighter Names: #{fight.fighter_names}"
      puts "All Fight Details: #{fight.fight_details.gsub("More Details", "")}"
      puts "Fight Link:" + "#{fight.fight_url}".yellow
      puts "--------------------------------------------------------------------------------------------".red
    end
  end

  # passes in fight number selected by the user,
  # iterates through scheduled fight details method
  # and selects index of fight matching number passed in.
  def fight_number(number)
    scheduled_fight_details.select.with_index(1) do |fight, index|
      if index == number
        puts ""
        puts "Selected fight:"
        puts    "--------------------------------------------------------------------------------------------".red
        puts "Fight ##{index}:".red
        puts "All details:" + " #{fight.fight_details}".gsub("More Details", "")
        puts "Fight Link:" +" #{fight.fight_url}".yellow
        puts    "---------------------------------------------------------------------------------------------".red
        puts ""
      end
    end
  end

  # gets user input for fight number
  def view_fight
    puts "Enter fight number to view specific fight: "
    fight_num_input = gets.strip.to_i
    fight_number(fight_num_input)
  end

  def print_fight_details(fight_detail)
    number_of_fights.each_with_index do|fight, index|
      if index < number_of_fights.size
        puts "Fight".blue + "##{index+1} ".red + "#{fight.send(fight_detail)}"
      end
    end
  end

  # calls Scraper scrape scheduled fights method.
  # gets user input and determines which option
  # to display based on number input by the user.
  def start
    scheduled_fights_scraper
    user_input = nil
    while user_input != 'exit'
      main_menu
      user_input = gets.strip.downcase
      case user_input
      when '1'
        scheduled_fight_details

        puts "Would you like to view a specific fight? (y/n)"
        input = gets.strip.downcase

        if input == 'y'
          view_fight
        end
      when '2'
        print_fight_details('channel_location')
      when '3'
        print_fight_details('fight_time')
      when '4'
        print_fight_details('fighter_names')
      when '5'
        print_fight_details('fight_url')
      when 'exit'
        goodbye
      when 'list'
        main_menu
      else
        puts "Invalid input, that is not an option."
      end
    end
  end

  def goodbye
    puts "Goodbye from The Boxing Schedules CLI App!".blue
    puts "------------------------------------------".red
  end

end
