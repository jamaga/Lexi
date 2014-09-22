require_relative '/vagrant/Week2/lexi'

describe Lexiconomitron do

	before :each do
		@lexi = Lexiconomitron.new(["is" ,"it", "workingT", "??"])
	end


	describe '#shazam' do
		it "takes an array of words, reverses words and eats Tt-s" do
			expect(Lexiconomitron.new(["is" ,"it", "workingT", "??"]).shazam).to eq(["si", "??"])
		end
		it "checks if all ts are removed" do
			expect(Lexiconomitron.new(["is" , "this", "turTle"]).shazam).to eq(["si", "elru"])
		end
		it "returns nil if parameter is not an array" do
			expect(Lexiconomitron.new("any").shazam).to eq(nil)
		end
		it "receiving empty array" do
			expect(Lexiconomitron.new([]).shazam).to eq([])
		end
	end


	describe '#oompa_loompa' do
		it "takes an array of words, returns words smaller than 3 letters, and eats Tt-s" do
			expect(Lexiconomitron.new(["is" ,"it", "workingT", "??"]).oompa_loompa).to eq(["is", "i", "??"])
		end
		it "chcks if Tts are properly removed" do
			expect(Lexiconomitron.new(["tT" , "tat", "toT"]).oompa_loompa).to eq(["", "a", "o"])
		end
		it "returns nil if parameter is not an array" do
			expect(Lexiconomitron.new(4).oompa_loompa).to eq(nil)
		end
		it "receiving empty array" do
			expect(Lexiconomitron.new([]).oompa_loompa).to eq([])
		end
	end

	describe '#devour_ts' do
	end

end

