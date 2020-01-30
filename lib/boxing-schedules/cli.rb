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

  # calls on Scraper class method
  def scheduled_fights_scraper
    BoxingSchedules::Scraper.scrape_scheduled_fights
  end

  # calls on all fight objects from Fight class
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

  # passes in fight number selected by the user and
  # fight detail for selected fight.
  # iterates through scheduled fight details method
  # and selects index of fight matching number passed in.
  def fight_number(number, fight_detail)
    number_of_fights.select.with_index(1) do |fight, index|
      if index == number
        puts ""
        puts "Selected fight:"
        puts    "--------------------------------------------------------------------------------------------".red
        puts "Fight ##{index}:".red
        puts "Selected details:" + " #{fight.send(fight_detail)}".gsub("More Details", "")
        puts "Fight Link:" +" #{fight.fight_url}".yellow
        puts    "---------------------------------------------------------------------------------------------".red
        puts ""
      end
    end
  end

  # gets user input for viewing specific fight.
  def view_fight_input
    puts "Would you like to view a specific fight? (y/n)"
    input = gets.strip.downcase
  end

  # gets user input for fight number selected.
  def view_fight(fight_detail)
    puts "Enter fight number to view specific fight: "
    fight_num_input = gets.strip.to_i
    fight_number(fight_num_input, fight_detail)
  end

  # determines if user chooses to
  # view specific fight number.
  def select_fight_number(selected_fight)
    if view_fight_input == 'y'
      view_fight(selected_fight)
    end
  end

  # prints out details for fights option
  # chosen by user using metaprograming.
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
        select_fight_number('fight_details')
      when '2'
        print_fight_details('channel_location')
        select_fight_number('channel_location')
      when '3'
        print_fight_details('fight_time')
        select_fight_number('fight_time')
      when '4'
        print_fight_details('fighter_names')
        select_fight_number('fighter_names')
      when '5'
        print_fight_details('fight_url')
        select_fight_number('fight_url')
      when 'exit'
        goodbye
      when 'list'
        main_menu
      else
        invalid_input
      end
    end
  end

  def invalid_input
    puts "Invalid input, that is not an option.".red
  end

  def goodbye
    puts "Goodbye from The Boxing Schedules CLI App!".blue
    puts "------------------------------------------".red
  end

end
