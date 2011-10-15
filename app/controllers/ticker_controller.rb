class TickerController < ApplicationController
  def index
    @bitcoinIndices = BitcoinIndex.select("date,AVG(usd) as usd,AVG(eur) as eur,date as dt").group("date").order("date")
  end
end
