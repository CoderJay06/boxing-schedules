CLI Data Gem Project Notes:

**Create A CLI Data gem that scrapes scheduled boxing fights**

1. Imagine your user interface for this Project
2. Start with the structure
3. Create the entry point - bin/run
4. force that to build the CLI interface
5. Stub out the interface
6. Start making things real
7. discover objects
8. Program

Clases:

User Interface(CLI):

- user types boxing-schedules

- a list of options/selections appear
- show list of boxing fights scheduled
_ a fight has:
  *fight details*
  1. fighter names
  2. fight location
  3. fight channel
  4. fight time
  5. fight url

Fight:

- stores and saves all fight objects

Scraper:

- scrapes all content for fight details

# scrape site: https://schedule.boxingscene.com/ or https://box.live/upcoming-fights-schedule/
# scheduled fight channels/locations selector: page.css("p.fight-channels").text.gsub("\n", " ")
# scheduled fight events selector: page.css("div.schedules a").map{|link| link["href"]}.join(" ").strip
# scheduled fight times selector: page.css(".schedule-time-block").text.gsub("\n", "").split.each
# fighter names selector: page.css(".fighter-name").text
# scheduled fight event details: page.css(".schedule-details-block").text.gsub("\n", "").split.each
