require 'sinatra'
require 'pry'
require 'sinatra/reloader' if settings.development?
require 'active_record'
require_relative 'models/crypto.rb'
require 'sinatra/cross_origin'

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
  @cryptos = []

  def calculate(crypto)
    price = Crypto.where(currency: crypto).first.close
    twenty_four_h = ((price.to_f - Crypto.offset(1).where(currency: crypto).first.close.to_f) / (Crypto.offset(1).where(currency: crypto).first.close.to_f) * 100).round(1) 
    seven_d = ((price.to_f - Crypto.offset(7).where(currency: crypto).first.close.to_f) / (Crypto.offset(7).where(currency: crypto).first.close.to_f) * 100).round(1)
    one_mth = ((price.to_f - Crypto.offset(30).where(currency: crypto).first.close.to_f) / (Crypto.offset(30).where(currency: crypto).first.close.to_f) * 100).round(1)
    twenty_four_h_volume = Crypto.where(currency: crypto).first.volume
    mkt_cap = Crypto.where(currency: crypto).first.market_cap
     
    @cryptos.push({
      "Currency" => crypto,
      "Price" => price,
      "24h" => "#{twenty_four_h}%",
      "7d" => "#{seven_d}%",
      "1 month" => "#{one_mth}%",
      "24h Volume" => twenty_four_h_volume,
      "Mkt Cap" => mkt_cap 
    })  
  end

  calculate("tezos")
  calculate("bitcoin")
  calculate("bnb")
  calculate("bitcoin-cash")
  calculate("cardano")
  calculate("eos")
  calculate("ethereum")
  calculate("litecoin")
  calculate("stellar")
  calculate("tether")
  calculate("xrp")

  content_type :json
  @cryptos.sort{
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