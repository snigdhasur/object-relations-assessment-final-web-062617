class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    self.title = title
    @@all << self 
  end

  def self.all
  	@@all
  end 

  def ratings 
  	Rating.all.select {|rating| rating.movie == self}
  end 

  def viewers 
  	self.ratings.map do |rating| 
  		rating.viewer.full_name
  	end.uniq 
  end 

  def average_rating 
  	score = 0
  	self.ratings.each do |rating|
  		score += rating.score
  	end 
  	average = score.to_f / self.ratings.size 
  	average.round(2)
  end 

  def self.find_by_title(title)
  	self.all.detect {|movie| movie.title == title}
  end 

end



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


class Rating
  attr_accessor :score, :viewer, :movie

  @@all = []

  def initialize(viewer, movie, score)
  	@viewer = viewer
  	@movie = movie 
  	@score = score 
  	@@all << self 
  end 

  def self.all
  	@@all 
  end 

end
