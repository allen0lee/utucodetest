require 'pry'
require 'active_record'
require_relative 'db_config'
require_relative 'models/crypto.rb'

class Calculation

  def self.cal(crypto)
    price = Crypto.where(currency: crypto).first.close
    twenty_four_h = ((price.to_f - Crypto.offset(1).where(currency: crypto).first.close.to_f) / (Crypto.offset(1).where(currency: crypto).first.close.to_f) * 100).round(1) 
    seven_d = ((price.to_f - Crypto.offset(7).where(currency: crypto).first.close.to_f) / (Crypto.offset(7).where(currency: crypto).first.close.to_f) * 100).round(1)
    one_mth = ((price.to_f - Crypto.offset(30).where(currency: crypto).first.close.to_f) / (Crypto.offset(30).where(currency: crypto).first.close.to_f) * 100).round(1)
    twenty_four_h_volume = Crypto.where(currency: crypto).first.volume
    mkt_cap = Crypto.where(currency: crypto).first.market_cap
     
    {
      "Currency" => crypto,
      "Price" => price,
      "24h" => "#{twenty_four_h}%",
      "7d" => "#{seven_d}%",
      "1 month" => "#{one_mth}%",
      "24h Volume" => twenty_four_h_volume,
      "Mkt Cap" => mkt_cap 
    }  
  end

end

# p Calculation.cal("tezos")


