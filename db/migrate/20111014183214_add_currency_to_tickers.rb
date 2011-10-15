class AddCurrencyToTickers < ActiveRecord::Migration
  def self.up
    add_column :tickers, :currency, :string
  end

  def self.down
    remove_column :tickers, :currency
  end
end
