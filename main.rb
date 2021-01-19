require 'sinatra'
require 'pry'
require 'sinatra/reloader' if settings.development?
require 'httparty'
require 'active_record'
require_relative 'db_config'
require_relative 'models/movie.rb'

get "/" do
    erb(:index)
end

get "/home" do
    erb(:index)
end

