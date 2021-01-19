# RUN ONLY ONCE!!!

require 'pg'
require 'csv'

db_conn = PG.connect(:dbname => 'utu_code_test', :host => 'localhost')

table = CSV.parse(File.read("crypto_historical_data.csv"), headers: true)

table.by_row.each do |line|
  currency = line[0]
  date = line[1]
  open = line[2]
  high = line[3]
  low = line[4]
  close = line[5]
  volume = line[6]
  market_cap = line[7]

  sql  = "INSERT INTO cryptos (currency, date, open, high, low, close, volume, market_cap)"
  sql += "VALUES ( '#{currency}', '#{date}', '#{open}', '#{high}', '#{low}', '#{close}', '#{volume}', '#{market_cap}');"

  db_conn.exec(sql)

end

db_conn.close

