include Bitcoin::Connection
include Bitcoin::Request
class BitcoinApi

  def self.loadvalues
    loadTime = Time.new
#    puts loadTime
#    puts loadTime.to_i
#    puts Time.at(loadTime)
    
    # MtGox ----------------------------------------------------
    puts "MtGox --------------"
    tkr = getMtGox('/code/data/ticker.php')['ticker']
    puts tkr
    @mtGox = Ticker.new
    @mtGox.load_time = loadTime.to_i
    @mtGox.exchangetype = "MtGox"
    @mtGox.high = tkr['high'].to_f
    @mtGox.last  = tkr['last'].to_f
    @mtGox.buy = tkr['buy'].to_f
    @mtGox.sell = tkr['sell'].to_f
    @mtGox.vwap = tkr['vwap'].to_f
    @mtGox.avg = tkr['avg'].to_f
    @mtGox.vol = tkr['vol'].to_f
    @mtGox.low = tkr['low'].to_f
    @mtGox.save
    # thUSD ----------------------------------------------------
    puts "thUSD --------------"
    tkr = getThUSD('/APIv1/USD/Ticker')['ticker']
    puts tkr
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
    @thUSD.save
    puts "Index calculation --------------"
    @ticker = BitcoinIndex.new
    @ticker.load_time = loadTime.to_i
    @ticker.date = loadTime
    @ticker.index = ((@mtGox.avg*@mtGox.vol) + (@thUSD.avg*@thUSD.vol))/(@mtGox.vol+@thUSD.vol)
    @ticker.save
  end
end