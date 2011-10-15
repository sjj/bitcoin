class TickerController < ApplicationController
  def index
    @bitcoinIndices = BitcoinIndex.select("date,avg(usd) as usd,avg(eur) as eur").group("date").order("date")
  end
end
