require 'imdb'

class SeriesMasterOfTheUniverse
	attr_accessor :series

	def initialize
		@series = [TVSeries.new("Game of Thrones"), TVSeries.new("RuPaul's Drag Race"), TVSeries.new("Dexter")]
	end

	def sort_by_rating
		sorted_movies = []
		@series.sort_by { |x| x.series_rating }.reverse.each {|x| sorted_movies << x}
		return sorted_movies
	end

	def print_movies_sorted_by_rating
		sort_by_rating.each_with_index do |x, index|
			puts (index + 1).to_s + ". " + x.title + "  " + x.series_rating.to_s
		end
	end

	def which_is_better(series1, series2)
		if series1.series_rating > series2.series_rating then return series1.title
		else return series2.title
		end
	end

end

class TVSeries
	attr_accessor :title, :series_rating, :actor

	def initialize(title)
		@title = title
		search_result = Imdb::Search.new(title).movies.first
		@series_rating = search_result.rating
		@actor = search_result.cast_members.first
		@content_rating = search_result.mpaa_rating
	end
end

tv = SeriesMasterOfTheUniverse.new
tv.print_movies_sorted_by_rating
