require_relative 'series_master.rb'

describe SeriesMasterOfTheUniverse do
	before :each do
		@series_object = SeriesMasterOfTheUniverse.new
	end

	describe '#sort_by_rating' do
		it 'It sorts the list of TV Series by rating' do
			expect(@series_object.sort_by_rating.map{|x| x.series_rating}).to eq([9.5, 9.0, 7.8])
		end
	end

	describe '#which_is_better' do
		it 'It will compare the ratings of two TV Series' do
			worse_series = TVSeries.new("RuPaul's Drag Race")
			better_series = TVSeries.new("Game of Thrones")
			expect(@series_object.which_is_better(worse_series, better_series)).to eq("Game of Thrones")
		end
	end

	describe '#most_famous_cast_member' do
		it 'It announces who the most famous cast member in the TV series is' do
			(TVSeries.new("Friends")).should == "Jennifer Aniston"
		end
	end

	describe '#sort_by_mpaa_rating' do
		it 'Sorts by the MPAA rating of the TV series' do
			TVSeries.new("Game of Thrones").should == 'R'
		end
	end
end

describe TVSeries do

	describe '#initialize' do
		it "Creates a new object with a title" do
		expect(TVSeries.new("Friends").title).to eq("Friends")
		end
		it "Creates a new object with a rating" do
		expect(TVSeries.new("Friends").series_rating).to eq(9.0)
		end
		it "Creates a new object with a cast member" do
		expect(TVSeries.new("Friends").actor).to eq("Jennifer Aniston")
		end
	end
end
