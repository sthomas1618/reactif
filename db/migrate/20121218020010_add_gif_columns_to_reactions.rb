class AddGifColumnsToReactions < ActiveRecord::Migration
  def change
    add_attachment :reactions, :gif
    add_column :reactions, :gif_fingerprint, :string
  end
end
