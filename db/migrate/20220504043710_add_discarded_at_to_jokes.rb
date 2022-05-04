class AddDiscardedAtToJokes < ActiveRecord::Migration[7.0]
  def change
    add_column :jokes, :discarded_at, :datetime
    add_index :jokes, :discarded_at
  end
end
