class AddIndexToFingerprintColumn < ActiveRecord::Migration
  def change
    add_index :reactions, :gif_fingerprint, unique: true
  end
end
