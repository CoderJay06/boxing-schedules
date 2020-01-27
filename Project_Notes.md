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

CLI:
- controller for the boxing schedules cli app
- calls on Scraper class method
- iterates over fights to display fight details for UI

Fight:
- makes fight objects from scraped data
- stores and saves all fight objects

Scraper:
- opens webpage for all upcoming fight data
- scrapes all content for fight details
