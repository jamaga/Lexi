class Lexiconomitron

	def initialize(array)
		@array = array
	end

	def devour_ts(word)
		word.delete! "tT"
		return word
	end

	def shazam
    if @array.is_a? Array
   		@array.each do |word|
   			word.reverse! 
   			word = devour_ts(word)
   		end
   		if @array.size > 1 
   			[@array.first, @array.last]
   		else 
   			@array
   		end
    else 
   		nil
   	end
	end

	def oompa_loompa
		if @array.is_a? Array
	 		array2 = []
   		@array.each do |word|
	   		if word.length <= 3 
	   			word = devour_ts(word)
	   			array2 << word
	   		end
	   			array2
   		end
   		return array2
 		else
 			nil
		end
	end
end

puts Lexiconomitron.new(["is" ,"it", "workingT", "??"]).oompa_loompa
