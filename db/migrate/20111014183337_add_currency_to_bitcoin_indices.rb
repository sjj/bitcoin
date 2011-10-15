class AddCurrencyToBitcoinIndices < ActiveRecord::Migration
  def self.up
    rename_column :bitcoin_indices, :index, :usd
    add_column :bitcoin_indices, :eur, :string
  end

  def self.down
    rename_column :bitcoin_indices, :usd, :index
    remove_column :bitcoin_indices, :eur
  end
end
