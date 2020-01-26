# This class scrapes scheduled upcoming fights
class BoxingSchedules::Scraper


  def self.open_scheduled_fights
    url = "https://schedule.boxingscene.com/"
    Nokogiri::HTML(open(url))
  end

  def self.scrape_scheduled_fights
    content = self.open_scheduled_fights.css("div.schedules")
    i = 0
    while i < 21 do
      fight = BoxingSchedules::Fight.new
      fight.channel_location = content.css("p.fight-channels")[i].text.split.join(" ")
      fight.fighter_names = content.css(".schedule-details-block div div")[i].text.split.join(" ").strip
      fight.fight_time = content.css(".schedule-time-block")[i].text.split.join(" ")
      fight.fight_details = content.css(".schedule-details-block")[i].text.split.join(" ")
      fight.fight_url = "https://schedule.boxingscene.com/" +  content.css("a")[i].attr("href")
      fight.save
      i += 1
      #binding.pry
    end
  end

end
