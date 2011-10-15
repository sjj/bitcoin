include Bitcoin::Connection
include Bitcoin::Request
class BitcoinApi

  def self.loadvalues
    loadTime = Time.new
#    puts loadTime
#    puts loadTime.to_i
#    puts Time.at(loadTime)
    
    # MtGox ----------------------------------------------------
    puts "MtGox --------------USD"
    tkr = getMtGox('/api/1/BTCUSD/public/ticker')['return']
    @mtGoxUSD = Ticker.new
    @mtGoxUSD.load_time = loadTime.to_i
    @mtGoxUSD.exchangetype = "MtGox"
    @mtGoxUSD.high = tkr['high']['value'].to_f
    @mtGoxUSD.last  = tkr['last']['value'].to_f
    @mtGoxUSD.buy = tkr['buy']['value'].to_f
    @mtGoxUSD.sell = tkr['sell']['value'].to_f
    @mtGoxUSD.vwap = tkr['vwap']['value'].to_f
    @mtGoxUSD.avg = tkr['avg']['value'].to_f
    @mtGoxUSD.vol = tkr['vol']['value'].to_f
    @mtGoxUSD.low = tkr['low']['value'].to_f
    @mtGoxUSD.currency = "USD"
    @mtGoxUSD.save
    puts "MtGox --------------EUR"
    tkr = getMtGox('/api/1/BTCEUR/public/ticker')['return']
    @mtGoxEUR = Ticker.new
    @mtGoxEUR.load_time = loadTime.to_i
    @mtGoxEUR.exchangetype = "MtGox"
    @mtGoxEUR.high = tkr['high']['value'].to_f
    @mtGoxEUR.last  = tkr['last']['value'].to_f
    @mtGoxEUR.buy = tkr['buy']['value'].to_f
    @mtGoxEUR.sell = tkr['sell']['value'].to_f
    @mtGoxEUR.vwap = tkr['vwap']['value'].to_f
    @mtGoxEUR.avg = tkr['avg']['value'].to_f
    @mtGoxEUR.vol = tkr['vol']['value'].to_f
    @mtGoxEUR.low = tkr['low']['value'].to_f
    @mtGoxEUR.currency = "EUR"
    @mtGoxEUR.save
    # Tradehill ----------------------------------------------------
    puts "Tradehill --------------USD"
    tkr = getThUSD('/APIv1/USD/Ticker')['ticker']
    @thUSD = Ticker.new
    @thUSD.load_time = loadTime.to_i
    @thUSD.exchangetype = "thUSD"
    @thUSD.high = tkr['high'].to_f
    @thUSD.last  = tkr['last'].to_f
    @thUSD.buy = tkr['buy'].to_f
    @thUSD.sell = tkr['sell'].to_f
    @thUSD.avg = (tkr['buy'].to_f + tkr['sell'].to_f)/2
    @thUSD.vol = tkr['vol'].to_f
    @thUSD.low = tkr['low'].to_f
    @thUSD.currency = "USD"
    @thUSD.save
    puts "Tradehill --------------EUR"
    tkr = getThUSD('/APIv1/EUR/Ticker')['ticker']
    @thEUR = Ticker.new
    @thEUR.load_time = loadTime.to_i
    @thEUR.exchangetype = "thUSD"
    @thEUR.high = tkr['high'].to_f
    @thEUR.last  = tkr['last'].to_f
    @thEUR.buy = tkr['buy'].to_f
    @thEUR.sell = tkr['sell'].to_f
    @thEUR.avg = (tkr['buy'].to_f + tkr['sell'].to_f)/2
    @thEUR.vol = tkr['vol'].to_f
    @thEUR.low = tkr['low'].to_f
    @thEUR.currency = "EUR"
    @thEUR.save
    
    puts "Index calculation --------------USD"
    @ticker = BitcoinIndex.new
    @ticker.load_time = loadTime.to_i
    @ticker.date = loadTime
    @ticker.usd = ((@mtGoxUSD.avg*@mtGoxUSD.vol) + (@thUSD.avg*@thUSD.vol))/(@mtGoxUSD.vol+@thUSD.vol)
    @ticker.eur = ((@mtGoxEUR.avg*@mtGoxEUR.vol) + (@thEUR.avg*@thEUR.vol))/(@mtGoxEUR.vol+@thEUR.vol)
    @ticker.save
  end
end