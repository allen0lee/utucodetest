require 'minitest/autorun'
require "minitest/reporters" # optional
Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new) # optional

require_relative 'calculation.rb'

class CalculationTest < Minitest::Test

  def test_calculation
    result = Calculation.cal("tezos")
    expected = 
      {
        "Currency"=>"tezos", 
        "Price"=>"1.25", 
        "24h"=>"-3.1%", 
        "7d"=>"-0.8%", 
        "1 month"=>"40.2%", 
        "24h Volume"=>"46,048,752", 
        "Mkt Cap"=>"824,588,509"
      }
    assert_equal expected, result
  end

end