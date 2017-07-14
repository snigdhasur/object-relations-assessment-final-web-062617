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
