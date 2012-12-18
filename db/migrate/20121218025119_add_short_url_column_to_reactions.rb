class AddShortUrlColumnToReactions < ActiveRecord::Migration
  def change
    add_column :reactions, :short_url, :string
  end
  add_index :reactions, :short_url
end
