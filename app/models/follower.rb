class Follower
  attr_reader :name, :age, :life_motto

  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def cults
    BloodOath.all.map do |oath| 
      if oath.follower == self
        oath.cult
      end
    end.compact
  end

  def join_cult(cult)
    BloodOath.new(cult, self)
  end

  def self.all
    @@all
  end

  def self.of_a_certain_age(age)
    Follower.all.map do |people|
      if people.age >= age
        people
      end
    end.compact
  end

end