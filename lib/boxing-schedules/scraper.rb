# This class scrapes scheduled upcoming fights
class BoxingSchedules::Scraper
  # scrape site: https://schedule.boxingscene.com/ or https://box.live/upcoming-fights-schedule/
  # scheduled fight channels/locations selector: page.css("p.fight-channels").text.gsub("\n", " ")
  # scheduled fight events selector: page.css("div.schedules a").map{|link| link["href"]}.join(" ").strip
  # scheduled fight times selector: page.css(".schedule-time-block").text.gsub("\n", "").split.each
  # fighter names selector: page.css(".fighter-name").text
  # scheduled fight event details: page.css(".schedule-details-block").text.gsub("\n", "").split.each

  def self.scrape_scheduled_fights
    url = "https://schedule.boxingscene.com/"
    page = Nokogiri::HTML(open(url))
    content = page.css("div.schedules")
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
