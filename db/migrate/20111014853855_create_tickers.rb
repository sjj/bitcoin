class CreateTickers < ActiveRecord::Migration
  def self.up
    drop_table :tickers
    create_table :tickers do |t|
      t.integer :load_time
      
      t.string :exchangetype

      t.decimal :high,
        :precision => 18,
        :scale => 9,
        :default => 0

      t.decimal :low,
        :precision => 18,
        :scale => 9,
        :default => 0
        
      t.decimal :avg,
        :precision => 18,
        :scale => 9,
        :default => 0
        
      t.decimal :vwap,
        :precision => 18,
        :scale => 9,
        :default => 0

      t.decimal :vol,
        :precision => 18,
        :scale => 9,
        :default => 0
        
      t.decimal :last,
        :precision => 18,
        :scale => 9,
        :default => 0
        
      t.decimal :buy,
        :precision => 18,
        :scale => 9,
        :default => 0

      t.decimal :sell,
        :precision => 18,
        :scale => 9,
        :default => 0

      t.string :currency

      t.timestamps
    end
  end

  def self.down
    drop_table :tickers
  end
end
