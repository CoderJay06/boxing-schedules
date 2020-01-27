class BoxingSchedules::Scraper

  # sets url for boxing schedules webpage, opens the page with Nokogiri.
  def self.open_scheduled_fights
    url = "https://schedule.boxingscene.com/"
    Nokogiri::HTML(open(url))
  end


  # loops through all upcoming fights on boxingscene.
  # scrapes all the fight details and sets fight attributes.
  # saves them to the Fight class variable all.
  def self.scrape_scheduled_fights
    content = self.open_scheduled_fights.css("div.schedules") 
    number_of_fights = open_scheduled_fights.css(".vs").size
    i = 0
    while i <  number_of_fights
      fight = BoxingSchedules::Fight.new
      fight.channel_location = content.css("p.fight-channels")[i].text.split.join(" ")
      fight.fighter_names = content.css(".schedule-details-block div div")[i].text.split.join(" ").strip
      fight.fight_time = content.css(".schedule-time-block")[i].text.split.join(" ")
      fight.fight_details = content.css(".schedule-details-block")[i].text.split.join(" ")
      fight.fight_url = "https://schedule.boxingscene.com/" +  content.css("a")[i].attr("href")
      fight.save
      i += 1
    end
  end

end
