class Cat
  # code goes here

  # Cat
  # Instance methods
  #   initializes with a name and an Owner
  #   can change its owner
  #   can't change its name (FAILED - 1)
  #   initializes with a nervous mood (FAILED - 2)
  #   can change its mood (FAILED - 3)

  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  def initialize(name, owner)
    @name = name 
    @owner = owner
    @mood = "nervous"
    save
  end 

  # Class methods
  # knows all the cats

  def save 
    @@all << self
  end 

  def self.all 
    @@all
  end 
end