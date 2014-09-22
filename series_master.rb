class SeriesMasterOfTheUniverse
	attr_accessor :series

	def initialize
		@series = [TVSeries.new("Game of Thrones", 9, "John"), TVSeries.new("RuPaul's Drag Race", 10, "RuPaul"), TVSeries.new("Dexter", 9, "Michael Hall")]
	end

	def sort_by_rating
		sorted_movies = []
		@series.sort_by {|x| x.rating }.each {|x| sorted_movies << x}
		return sorted_movies
	end

	def print_movies_sorted_by_rating
		sort_by_rating.each_with_index do |x, index|
			puts (index + 1).to_s + ". " + x.title + "  " + x.rating.to_s
		end
	end

	def which_is_better(series1, series2)
		if series1.rating > series2.rating then return series1.title
		else return series2.title
		end
	end

end

class TVSeries
	attr_accessor :title, :rating, :actor

	def initialize(title, rating, actor)
		@title = title
		@rating = rating
		@actor = actor
	end
end

SeriesMasterOfTheUniverse.new
