class CreateBitcoinIndice < ActiveRecord::Migration
  def self.up
    drop_table :bitcoin_indices
    create_table :bitcoin_indices do |t|
      t.integer :load_time
      t.date :date
      t.decimal :usd,
        :precision => 18,
        :scale => 9,
        :default => 0
      t.decimal :eur,
        :precision => 18,
        :scale => 9,
        :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :bitcoin_indices
  end
end
