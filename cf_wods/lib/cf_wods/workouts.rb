class CfWods::Workouts 
  
  attr_accessor :name, :month, :info
  
  @@all = []
  
  def initialize(name, month)
    @name = name 
    @month = month
    @@all << self
    @info = []
    #notify month about the workout
    add_to_month
  end
  
  def self.all
    @@all
  end
  
  def add_to_month
    @month.workouts << self unless @month.workouts.include?(self)
  end
  
  def get_workout_info
    CfWods::Scraper.scrape_info(self) if @info.empty?
  end
  
end