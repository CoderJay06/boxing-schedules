class BoxingSchedules::Fight
  attr_accessor :fight_details, :fighter_names, :channel_location, :fight_time, :fight_url

  @@all = []

  # saves all fight objects
  def save
    @@all << self
  end

  # displays all fight objects
  def self.all
    @@all
  end

end
