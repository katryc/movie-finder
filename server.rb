require 'sinatra'
require './models/siskel.rb'


get '/:name' do
title = params[:name]
 @movie = Siskel.new(title)
 # "The movie title is #{movie.title}"

erb :index
end
