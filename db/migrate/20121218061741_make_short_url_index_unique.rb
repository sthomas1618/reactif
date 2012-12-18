class MakeShortUrlIndexUnique < ActiveRecord::Migration
  def change
    remove_index  :reactions, :short_url
    add_index :reactions, :short_url, unique: true
  end
end
