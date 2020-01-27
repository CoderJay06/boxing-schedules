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

  def create_fights(fight_array)
    fight_array.each_with_index do |fight, index|
    end
    binding.pry
  end
end
