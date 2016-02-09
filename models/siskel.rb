require 'httparty'

class Siskel
  attr_reader :title, :rating, :year, :plot, :consensus

  def initialize(title, opts = {}) # creating options hash
    year = opts[:year]
    plot_type = opts[:plot].to_s
    p plot_type
    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{year}&plot=[plot_type]&tomatoes=true")
    @title = @movie['Title'] == nil ? "Movie not found!" : @movie['Title'] # if response is error, then return movie is not found
    # @title ||= @movie['Error']
    @rating = @movie['Rated']
    @year = @movie['Year']
    @plot = @movie['Plot']
    # p "tomato meter", @movie["tomatoMeter"]
    meter = @movie["tomatoMeter"].to_i
    if meter > 50
      @consensus = "Thumbs Up"
    else
      @consensus = "Thumbs Down"
    end
    # if @plot =
  end
end
