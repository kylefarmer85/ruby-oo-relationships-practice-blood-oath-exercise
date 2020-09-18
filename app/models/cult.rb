class Cult
  attr_accessor
  attr_reader :name, :location, :founding_year, :slogan

  @@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def recruit_follower(follower)
    BloodOath.new(self, follower)
  end

  def cult_population
    BloodOath.all.select {|person| person.cult == self}.count
  end
  
  def self.all
    @@all
  end

  def self.find_by_name(name)
    Cult.all.find {|cult| cult.name == name}
  end 

  def self.find_by_location(location)
    Cult.all.select {|cult| cult.location == location}
  end

  def self.find_by_founding_year(year)
    Cult.all.find {|cult| cult.founding_year == year}
  end

  def average_age
    age_total = 0.0
    count = 0
    BloodOath.all.each do |person| 
      if person.cult == self
        age_total += person.follower.age
        count += 1
      end
    end
    age_total / count
  end

  def my_followers_mottos
    BloodOath.all.each do |oath|
      if oath.cult == self
        puts oath.follower.life_motto
      end
    end
  end

  def self.least_popular
    min_num = nil
    min_cult = nil
    Cult.all.each do |cult|
      if cult.cult_population < min_num || min_num == nil
        nim_num = cult.cult_population
        min_cult = cult
      end
    end
    min_cult
  end

  def self.most_common_location
    newhash = {}
    Cult.all.each do |cult|
        if newhash[cult.location]
            newhash[cult.location] += 1
        else
            newhash[cult.location] = 0
            newhash[cult.location] += 1
        end
    end
    big_location = 0
    best_location = ""
    newhash.each do |key, value|
        if value > big_location || big_location == nil
            big_location = value
            best_location = key
        end
    end
    best_location
  end



end