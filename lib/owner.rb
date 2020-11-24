class Owner
  
  attr_reader :species, :name

  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end 

  def say_species 
    "I am a human."
  end 

  def self.all
    @@all
  end 

  def self.count
    @@all.count
  end 

  def self.reset_all
    @@all.clear 
  end
  
  def cats
    Cat.all.select {|c| c.owner == self}
  end 

  def dogs
    Dog.all.select {|d| d.owner == self}
  end 
  
  def buy_cat(name)
    cat = Cat.new(name, self, mood = "happy")
  end 

  def buy_dog(name)
    dog = Dog.new(name, self, mood = "happy")
  end

  def walk_dogs
    dogs.map {|d| d.mood = "happy"} 
  end 

  def feed_cats
    cats.select {|c| c.mood = "happy"}
  end 

  def sell_pets
    cats.select {|c| c.mood = "nervous"}
    dogs.select {|d| d.mood = "nervous"}
    cats.select {|c| c.owner = nil}
    dogs.select {|d| d.owner = nil}


  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end


    

  
end