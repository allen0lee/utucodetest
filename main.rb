require 'sinatra'
require 'pry'
require 'sinatra/reloader' if settings.development?
require 'sinatra/cross_origin'
require_relative 'calculation.rb'

# code that enables CORS on server side
set :bind, '0.0.0.0'
configure do
  enable :cross_origin
end
before do
  response.headers['Access-Control-Allow-Origin'] = '*'
end
  
# routes
get "/" do
  erb(:index)
end

get "/crypto_api" do
  cryptos = []

  cryptos.push(Calculation.cal("tezos"))
  cryptos.push(Calculation.cal("bitcoin"))
  cryptos.push(Calculation.cal("bnb"))
  cryptos.push(Calculation.cal("bitcoin-cash"))
  cryptos.push(Calculation.cal("cardano"))
  cryptos.push(Calculation.cal("eos"))
  cryptos.push(Calculation.cal("ethereum"))
  cryptos.push(Calculation.cal("litecoin"))
  cryptos.push(Calculation.cal("stellar"))
  cryptos.push(Calculation.cal("tether"))
  cryptos.push(Calculation.cal("xrp"))

  content_type :json
  cryptos.sort{
    |a, b| b["Mkt Cap"].gsub(/[^0-9]/,'').to_i <=> a["Mkt Cap"].gsub(/[^0-9]/,'').to_i
  }.to_json

end

# code that enables CORS on server side
options "*" do
  response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "*"
  200
end