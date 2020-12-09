require 'pry'

class Owner
  # code goes here

  # Owner
  # Instance methods
  #   #name
  #     can have a name
  #     cannot change owner's name
  #  #species
  #     initializes with species set to human
  #     can't change its species

  attr_accessor :cat
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    save
  end 

  def say_species
    "I am a human."
  end 

  def save
    @@all << self 
  end 

  # Class methods
  # .all returns all instances of Owner that have been created
  # .count returns the number of owners that have been created
  # .reset_all can reset the owners that have been created


  def self.all 
    @@all 
  end 

  def self.count 
    self.all.count
  end 

  def self.reset_all 
    self.all.clear
  end 

  # Owner instance methods
  # #cats
  #   returnsa a collection of all the cats that belong to the owner
  # #dogs
  #   returnsa a collection of all the dogs that belong to the owner 
  # #buy_cat
  #   can buy a cat that is an instance of the Cat class 
  #   knows about its cats 
  # #buy_dog
  #   can buy a dog that is an instance of the Dog class 
  #   knows about its dogs 
  # #walk_dogs
  #   walks the dogs which makes the dogs' moods happy 
  # #feed_cats
  #   feeds cats which makes the cats' moods happy 
  # #sell_pets
  #   can sell all its pets, which makes them nervous 
  #   can sell all its pets, which leaves them without an owner 
  # #list_pets
  #   can list off its pets 


  def cats 
    Cat.all.select {|cat| cat.owner == self }
  end 

  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end 


  # #SPEC -- @owner.buy_cat("Crookshanks")
  # it 'knows about its dogs' do
  #   @owner.buy_dog("Snuffles")

  def buy_cat(name)
    Cat.new(name, self)
  end 

  def buy_dog(name)
    Dog.new(name, self)
  end 

  # describe "#walk_dogs" do
  #   it "walks the dogs which makes the dogs' moods happy" do
  #     dog = Dog.new("Daisy", @owner)
  #     @owner.walk_dogs
  #     expect(dog.mood).to eq("happy")
  #   end
  # end

  def walk_dogs
    self.dogs.collect {|dog| dog.mood = "happy"}
  end 

  def feed_cats
    self.cats.collect {|cat| cat.mood = "happy"}
  end 



  #SPEC -- [fido, tabby].each {|o| o.mood = "happy" }


  def sell_pets
    pets = cats + dogs 

    pets.each {|pet| pet.mood = "nervous"}
    pets.each {|pet| pet.owner = nil}

  end 

    #  #list_pets
    #  can list off its pets

    #SPEC -- expect(@owner.list_pets).to eq("I have #{@owner.dogs.count} dog(s), and #{@owner.cats.count} cat(s).")


  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end