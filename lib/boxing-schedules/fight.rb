class BoxingSchedules::Fight
  attr_accessor :fight_details, :fighter_names, :channel_location, :fight_time, :fight_url

  @@all = []

  # def initialize(fight_attributes)
  #   fight_attributes.each {|fight, details| self.send(("#{fight}="), details)}
  #   save
  #   binding.pry
  # end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
end
