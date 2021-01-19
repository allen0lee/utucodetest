require 'sinatra'
require 'pry'
require 'sinatra/reloader' if settings.development?
require 'httparty'
require 'active_record'
require_relative 'db_config'
require_relative 'models/crypto.rb'


get "/" do
  erb(:index)
end

get "/crypto_api" do
  cryptos = []

  tezos_price = Crypto.where(currency: "tezos").first.close
  tezos_24h = ((tezos_price.to_f - Crypto.offset(1).where(currency: "tezos").first.close.to_f) / (Crypto.offset(1).where(currency: "tezos").first.close.to_f) * 100).round(1) 
  tezos_7d = ((tezos_price.to_f - Crypto.offset(7).where(currency: "tezos").first.close.to_f) / (Crypto.offset(7).where(currency: "tezos").first.close.to_f) * 100).round(1)
  tezos_1mth = ((tezos_price.to_f - Crypto.offset(30).where(currency: "tezos").first.close.to_f) / (Crypto.offset(30).where(currency: "tezos").first.close.to_f) * 100).round(1)
  tezos_24h_volume = Crypto.where(currency: "tezos").first.volume
  tezos_mkt_cap = Crypto.where(currency: "tezos").first.market_cap
   
  cryptos.push({
    "Currency" => "Tezos",
    "Price" => tezos_price,
    "24h" => "#{tezos_24h}%",
    "7d" => "#{tezos_7d}%",
    "1 month" => "#{tezos_1mth}%",
    "24h Volume" => tezos_24h_volume,
    "Mkt Cap" => tezos_mkt_cap 
  })

  bitcoin_price = Crypto.where(currency: "bitcoin").first.close
  bitcoin_24h = ((bitcoin_price.to_f - Crypto.offset(1).where(currency: "bitcoin").first.close.to_f) / (Crypto.offset(1).where(currency: "bitcoin").first.close.to_f) * 100).round(1) 
  bitcoin_7d = ((bitcoin_price.to_f - Crypto.offset(7).where(currency: "bitcoin").first.close.to_f) / (Crypto.offset(7).where(currency: "bitcoin").first.close.to_f) * 100).round(1)
  bitcoin_1mth = ((bitcoin_price.to_f - Crypto.offset(30).where(currency: "bitcoin").first.close.to_f) / (Crypto.offset(30).where(currency: "bitcoin").first.close.to_f) * 100).round(1)
  bitcoin_24h_volume = Crypto.where(currency: "bitcoin").first.volume
  bitcoin_mkt_cap = Crypto.where(currency: "bitcoin").first.market_cap

  cryptos.push({
    "Currency" => "Bitcoin",
    "Price" => bitcoin_price,
    "24h" => "#{bitcoin_24h}%",
    "7d" => "#{bitcoin_7d}%",
    "1 month" => "#{bitcoin_1mth}%",
    "24h Volume" => bitcoin_24h_volume,
    "Mkt Cap" => bitcoin_mkt_cap 
  })

  bnb_price = Crypto.where(currency: "bnb").first.close
  bnb_24h = ((bnb_price.to_f - Crypto.offset(1).where(currency: "bnb").first.close.to_f) / (Crypto.offset(1).where(currency: "bnb").first.close.to_f) * 100).round(1) 
  bnb_7d = ((bnb_price.to_f - Crypto.offset(7).where(currency: "bnb").first.close.to_f) / (Crypto.offset(7).where(currency: "bnb").first.close.to_f) * 100).round(1)
  bnb_1mth = ((bnb_price.to_f - Crypto.offset(30).where(currency: "bnb").first.close.to_f) / (Crypto.offset(30).where(currency: "bnb").first.close.to_f) * 100).round(1)
  bnb_24h_volume = Crypto.where(currency: "bnb").first.volume
  bnb_mkt_cap = Crypto.where(currency: "bnb").first.market_cap

  cryptos.push({
    "Currency" => "BNB",
    "Price" => bnb_price,
    "24h" => "#{bnb_24h}%",
    "7d" => "#{bnb_7d}%",
    "1 month" => "#{bnb_1mth}%",
    "24h Volume" => bnb_24h_volume,
    "Mkt Cap" => bnb_mkt_cap 
  })

  bitcoincash_price = Crypto.where(currency: "bitcoin-cash").first.close
  bitcoincash_24h = ((bitcoincash_price.to_f - Crypto.offset(1).where(currency: "bitcoin-cash").first.close.to_f) / (Crypto.offset(1).where(currency: "bitcoin-cash").first.close.to_f) * 100).round(1) 
  bitcoincash_7d = ((bitcoincash_price.to_f - Crypto.offset(7).where(currency: "bitcoin-cash").first.close.to_f) / (Crypto.offset(7).where(currency: "bitcoin-cash").first.close.to_f) * 100).round(1)
  bitcoincash_1mth = ((bitcoincash_price.to_f - Crypto.offset(30).where(currency: "bitcoin-cash").first.close.to_f) / (Crypto.offset(30).where(currency: "bitcoin-cash").first.close.to_f) * 100).round(1)
  bitcoincash_24h_volume = Crypto.where(currency: "bitcoin-cash").first.volume
  bitcoincash_mkt_cap = Crypto.where(currency: "bitcoin-cash").first.market_cap

  cryptos.push({
    "Currency" => "Bitcoin Cash",
    "Price" => bitcoincash_price,
    "24h" => "#{bitcoincash_24h}%",
    "7d" => "#{bitcoincash_7d}%",
    "1 month" => "#{bitcoincash_1mth}%",
    "24h Volume" => bitcoincash_24h_volume,
    "Mkt Cap" => bitcoincash_mkt_cap 
  })

  cardano_price = Crypto.where(currency: "cardano").first.close
  cardano_24h = ((cardano_price.to_f - Crypto.offset(1).where(currency: "cardano").first.close.to_f) / (Crypto.offset(1).where(currency: "cardano").first.close.to_f) * 100).round(1) 
  cardano_7d = ((cardano_price.to_f - Crypto.offset(7).where(currency: "cardano").first.close.to_f) / (Crypto.offset(7).where(currency: "cardano").first.close.to_f) * 100).round(1)
  cardano_1mth = ((cardano_price.to_f - Crypto.offset(30).where(currency: "cardano").first.close.to_f) / (Crypto.offset(30).where(currency: "cardano").first.close.to_f) * 100).round(1)
  cardano_24h_volume = Crypto.where(currency: "cardano").first.volume
  cardano_mkt_cap = Crypto.where(currency: "cardano").first.market_cap

  cryptos.push({
    "Currency" => "Cardano",
    "Price" => cardano_price,
    "24h" => "#{cardano_24h}%",
    "7d" => "#{cardano_7d}%",
    "1 month" => "#{cardano_1mth}%",
    "24h Volume" => cardano_24h_volume,
    "Mkt Cap" => cardano_mkt_cap 
  })

  eos_price = Crypto.where(currency: "eos").first.close
  eos_24h = ((eos_price.to_f - Crypto.offset(1).where(currency: "eos").first.close.to_f) / (Crypto.offset(1).where(currency: "eos").first.close.to_f) * 100).round(1) 
  eos_7d = ((eos_price.to_f - Crypto.offset(7).where(currency: "eos").first.close.to_f) / (Crypto.offset(7).where(currency: "eos").first.close.to_f) * 100).round(1)
  eos_1mth = ((eos_price.to_f - Crypto.offset(30).where(currency: "eos").first.close.to_f) / (Crypto.offset(30).where(currency: "eos").first.close.to_f) * 100).round(1)
  eos_24h_volume = Crypto.where(currency: "eos").first.volume
  eos_mkt_cap = Crypto.where(currency: "eos").first.market_cap

  cryptos.push({
    "Currency" => "EOS",
    "Price" => eos_price,
    "24h" => "#{eos_24h}%",
    "7d" => "#{eos_7d}%",
    "1 month" => "#{eos_1mth}%",
    "24h Volume" => eos_24h_volume,
    "Mkt Cap" => eos_mkt_cap 
  })

  ethereum_price = Crypto.where(currency: "ethereum").first.close
  ethereum_24h = ((ethereum_price.to_f - Crypto.offset(1).where(currency: "ethereum").first.close.to_f) / (Crypto.offset(1).where(currency: "ethereum").first.close.to_f) * 100).round(1) 
  ethereum_7d = ((ethereum_price.to_f - Crypto.offset(7).where(currency: "ethereum").first.close.to_f) / (Crypto.offset(7).where(currency: "ethereum").first.close.to_f) * 100).round(1)
  ethereum_1mth = ((ethereum_price.to_f - Crypto.offset(30).where(currency: "ethereum").first.close.to_f) / (Crypto.offset(30).where(currency: "ethereum").first.close.to_f) * 100).round(1)
  ethereum_24h_volume = Crypto.where(currency: "ethereum").first.volume
  ethereum_mkt_cap = Crypto.where(currency: "ethereum").first.market_cap

  cryptos.push({
    "Currency" => "Ethereum",
    "Price" => ethereum_price,
    "24h" => "#{ethereum_24h}%",
    "7d" => "#{ethereum_7d}%",
    "1 month" => "#{ethereum_1mth}%",
    "24h Volume" => ethereum_24h_volume,
    "Mkt Cap" => ethereum_mkt_cap 
  })

  litecoin_price = Crypto.where(currency: "litecoin").first.close
  litecoin_24h = ((litecoin_price.to_f - Crypto.offset(1).where(currency: "litecoin").first.close.to_f) / (Crypto.offset(1).where(currency: "litecoin").first.close.to_f) * 100).round(1) 
  litecoin_7d = ((litecoin_price.to_f - Crypto.offset(7).where(currency: "litecoin").first.close.to_f) / (Crypto.offset(7).where(currency: "litecoin").first.close.to_f) * 100).round(1)
  litecoin_1mth = ((litecoin_price.to_f - Crypto.offset(30).where(currency: "litecoin").first.close.to_f) / (Crypto.offset(30).where(currency: "litecoin").first.close.to_f) * 100).round(1)
  litecoin_24h_volume = Crypto.where(currency: "litecoin").first.volume
  litecoin_mkt_cap = Crypto.where(currency: "litecoin").first.market_cap

  cryptos.push({
    "Currency" => "Litecoin",
    "Price" => litecoin_price,
    "24h" => "#{litecoin_24h}%",
    "7d" => "#{litecoin_7d}%",
    "1 month" => "#{litecoin_1mth}%",
    "24h Volume" => litecoin_24h_volume,
    "Mkt Cap" => litecoin_mkt_cap 
  })

  stellar_price = Crypto.where(currency: "stellar").first.close
  stellar_24h = ((stellar_price.to_f - Crypto.offset(1).where(currency: "stellar").first.close.to_f) / (Crypto.offset(1).where(currency: "stellar").first.close.to_f) * 100).round(1) 
  stellar_7d = ((stellar_price.to_f - Crypto.offset(7).where(currency: "stellar").first.close.to_f) / (Crypto.offset(7).where(currency: "stellar").first.close.to_f) * 100).round(1)
  stellar_1mth = ((stellar_price.to_f - Crypto.offset(30).where(currency: "stellar").first.close.to_f) / (Crypto.offset(30).where(currency: "stellar").first.close.to_f) * 100).round(1)
  stellar_24h_volume = Crypto.where(currency: "stellar").first.volume
  stellar_mkt_cap = Crypto.where(currency: "stellar").first.market_cap

  cryptos.push({
    "Currency" => "Stellar",
    "Price" => stellar_price,
    "24h" => "#{stellar_24h}%",
    "7d" => "#{stellar_7d}%",
    "1 month" => "#{stellar_1mth}%",
    "24h Volume" => stellar_24h_volume,
    "Mkt Cap" => stellar_mkt_cap 
  })

  tether_price = Crypto.where(currency: "tether").first.close
  tether_24h = ((tether_price.to_f - Crypto.offset(1).where(currency: "tether").first.close.to_f) / (Crypto.offset(1).where(currency: "tether").first.close.to_f) * 100).round(1) 
  tether_7d = ((tether_price.to_f - Crypto.offset(7).where(currency: "tether").first.close.to_f) / (Crypto.offset(7).where(currency: "tether").first.close.to_f) * 100).round(1)
  tether_1mth = ((tether_price.to_f - Crypto.offset(30).where(currency: "tether").first.close.to_f) / (Crypto.offset(30).where(currency: "tether").first.close.to_f) * 100).round(1)
  tether_24h_volume = Crypto.where(currency: "tether").first.volume
  tether_mkt_cap = Crypto.where(currency: "tether").first.market_cap 

  cryptos.push({
    "Currency" => "Tether",
    "Price" => tether_price,
    "24h" => "#{tether_24h}%",
    "7d" => "#{tether_7d}%",
    "1 month" => "#{tether_1mth}%",
    "24h Volume" => tether_24h_volume,
    "Mkt Cap" => tether_mkt_cap 
  })

  xrp_price = Crypto.where(currency: "xrp").first.close
  xrp_24h = ((xrp_price.to_f - Crypto.offset(1).where(currency: "xrp").first.close.to_f) / (Crypto.offset(1).where(currency: "xrp").first.close.to_f) * 100).round(1) 
  xrp_7d = ((xrp_price.to_f - Crypto.offset(7).where(currency: "xrp").first.close.to_f) / (Crypto.offset(7).where(currency: "xrp").first.close.to_f) * 100).round(1)
  xrp_1mth = ((xrp_price.to_f - Crypto.offset(30).where(currency: "xrp").first.close.to_f) / (Crypto.offset(30).where(currency: "xrp").first.close.to_f) * 100).round(1)
  xrp_24h_volume = Crypto.where(currency: "xrp").first.volume
  xrp_mkt_cap = Crypto.where(currency: "xrp").first.market_cap 

  cryptos.push({
    "Currency" => "XRP",
    "Price" => xrp_price,
    "24h" => "#{xrp_24h}%",
    "7d" => "#{xrp_7d}%",
    "1 month" => "#{xrp_1mth}%",
    "24h Volume" => xrp_24h_volume,
    "Mkt Cap" => xrp_mkt_cap 
  })

  content_type :json
  cryptos.sort{
    |a, b| b["Mkt Cap"].gsub(/[^0-9]/,'').to_i <=> a["Mkt Cap"].gsub(/[^0-9]/,'').to_i
  }.to_json

  # content_type :json
  # [
  #   { 
  #     "Currency": "Tezos",
  #     "Price": tezos_price,
  #     "24h": "#{tezos_24h}%",
  #     "7d": "#{tezos_7d}%",
  #     "1 month": "#{tezos_1mth}%",
  #     "24h Volume": tezos_24h_volume,
  #     "Mkt cap": tezos_mkt_cap
  #   }
  # ].to_json


    
end

# Crypto.where(currency: "bitcoin").first
# Crypto.offset(30).where(currency: "bitcoin").first