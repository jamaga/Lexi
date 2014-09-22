require_relative 'series_master.rb'

describe SeriesMasterOfTheUniverse do
	before :each do
		@series_object = SeriesMasterOfTheUniverse.new
	end

	describe '#sort_by_rating' do
		it 'It sorts the list of TV Series by rating' do
			expect(@series_object.sort_by_rating.map{|x| x.rating}).to eq([9, 9, 10])
		end
	end

	describe '#which_is_better' do
		it 'It will compare the ratings of two TV Series' do
			better_series = TVSeries.new("RuPaul's Drag Race", 10, "RuPaul")
			worse_series = TVSeries.new("Game of Thrones", 9, "John")
			expect(@series_object.which_is_better(worse_series, better_series)).to eq("RuPaul's Drag Race")
		end
	end
end

describe TVSeries do

	describe '#initialize' do
		it "Creates a new object with a title" do
		expect(TVSeries.new("Friends", 7, "Jennifer Aniston").title).to eq("Friends")
		end
		it "Creates a new object with a rating" do
		expect(TVSeries.new("Friends", 7, "Jennifer Aniston").rating).to eq(7)
		end
		it "Creates a new object with a title" do
		expect(TVSeries.new("Friends", 7, "Jennifer Aniston").actor).to eq("Jennifer Aniston")
		end
	end
end
