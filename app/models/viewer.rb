class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self 
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
  	@@all
  end 

  def self.find_by_name(name)
  	self.all.detect {|viewer| viewer.full_name == name}
  end 

  def create_rating(movie, score)
  	Rating.new(self, movie, score) 
  end 

  def ratings 
  	Rating.all.select {|rating| rating.viewer == self}
  end 

  def movies_seen
  	self.ratings.map do |rating|
  		rating.movie.title 
  	end.uniq
  end

end
