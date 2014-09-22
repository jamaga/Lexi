require 'imdb'

class SeriesMasterOfTheUniverse
	attr_accessor :series

	def initialize
		@series = [TVSeries.new("Game of Thrones"), TVSeries.new("RuPaul's Drag Race"), TVSeries.new("Dexter"), TVSeries.new("Friends")]
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

	def most_famous_cast_member(tv_series)
		return tv_series.actor
	end

	def find_series_of_genre(series_genre)
		@series.select do |series|
				series.genre.include? series_genre 
		end.map {|series| series.title }
	end

	def search_by_word(word)
		Imdb::Search.new(word).movies.size
	end

	def most_episodes
		sorted_movie = []
		@series.sort_by { |x| x.number_of_episodes }.reverse.each {|x| sorted_movie << x}
		return sorted_movie[0].title
	end

end

class TVSeries
	attr_accessor :title, :series_rating, :actor, :genre, :number_of_episodes, :imdb_id

	def initialize(title)
		@title = title
		search_result = Imdb::Search.new(title).movies.first
		@series_rating = search_result.rating
		@actor = search_result.cast_members.first
		@genre = search_result.genres
		@imdb_id = search_result.id 
		@number_of_episodes = get_number_of_episodes
	end

	def get_number_of_episodes
		total_eps = 0
		series = Imdb::Serie.new(@imdb_id)
		seasons_num = series.seasons.size 
		for i in 1..seasons_num
			total_eps += series.season(i).episodes.size
		end
		return total_eps
	end
end



tv = SeriesMasterOfTheUniverse.new
# tv.print_movies_sorted_by_rating
