class TickerController < ApplicationController
  def index
    @bitcoinIndices = BitcoinIndex.select("date,AVG(usd) as usd,AVG(eur) as eur").group("date").order("date")
  end
end
