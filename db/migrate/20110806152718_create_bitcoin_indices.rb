class CreateBitcoinIndices < ActiveRecord::Migration
  def self.up
    create_table :bitcoin_indices do |t|
      t.integer :load_time
      t.date :date
      t.decimal :index,
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
