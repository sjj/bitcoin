class TickerController < ApplicationController
  
  def index
    @bitcoinIndices = BitcoinIndex.average(:index,:group => 'date')
  end

end
